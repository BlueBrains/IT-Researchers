class HomeController < ApplicationController
 before_action :set_paper, only: [:show]

  def index  	  	
    @researcher = current_researcher
  	@researchers = Researcher.all
    @papers=Paper.all.limit(8)  
    @index=false

    #render :file=>'home/index' , :layout=>false     
    # @researchers = Researcher.collection.aggregate([
    #   {"$unwind" => "$paper_ids"},
    #   {"$group" => {_id: "$_id", paper_ids: {"$push"=>"$paper_ids"}, size: {"$sum" => 1}}}, 
    #   {"$sort" => {size: 1}}]);
    @most_watched_papers=Paper.order_by(:times_seen => 'desc').limit(8)
  end
    
  def show
    @paper.inc(times_seen: 1)
    @related_papers = @paper.similar.limit(3)
  end

  def like_it
  	@paper = Paper.find(params[:id])
  	if(current_researcher.likes.nil? || (!current_researcher.likes.include? @paper.id))
  		@paper.push(likers: current_researcher.id)
  		current_researcher.push(likes: @paper.id)
  		@paper.inc(likes: 1)
  	else
		@paper.pull(likers: current_researcher.id)
		current_researcher.pull(likes: @paper.id)
  		@paper.inc(likes: -1)
  	end
  	redirect_to paper_path(@paper)
  end

  def set_paper
    @paper = Paper.find(params[:id])
  end
end
