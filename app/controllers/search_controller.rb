class SearchController < ApplicationController
  def new                   
  end
  def show
    Paper.reindex
    @results=Paper.search params[:phrase], fields: [:title, :abstract, :introduction, :tags, :keywords], highlight: true, highlight: {tag: "<strong style='background: yellow;'>"}
    #render file: "search/_new"
    respond_to do |format|
      format.html
      format.js
    end
  end
  private
  def search_params    
     pars=params.permit(:search_title,:min_date,:max_date,:exact_match,:tags,:category,:timeago,:page,:partial_match,:researcher_ids)
     query={}
     if(pars[:category])
       query[:category_id]=Category.where(name: pars[:category]).first.id.to_s
     end
     if(pars[:tags].present?)
       query[:tags_id]={all: Tag.in(name: pars[:tags].split("/")).map{|tag| tag.id.to_s}}
     end
     if(pars[:timeago].present?)      
        query[:created_at]=params[:timeago]..DateTime.new                 
     elsif(pars[:min_date].present?)
        if(pars[:max_date].present?)        
          query[:created_at]=params[:min_date]..params[:max_date]
        else
          query[:created_at]=params[:min_date]..DateTime.new
        end            
     end
     if(pars[:researcher_ids].present?)
       query[:researcher_ids]={all: pars[:researcher_ids]}
     end
     if(pars[:exact_match])
       a=[params[:search_title],{where: query , fields: [{"title^10" => :exact}  , :content], page: params[:page], per_page: 16}]
     else       
       a=[params[:search_title], {where: query , fields: ["title^10" , :content], page: params[:page], per_page: 16}]
     end
     if(pars[:partial_match])
       a[1][:operator]=:or
     end
     a[1][:misspellings]={below: 16}        
     a 
  end
end