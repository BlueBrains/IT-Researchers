class SearchController < ApplicationController
  def new
    pars=search_params
    if(pars!=nil)
      @results=Paper.search pars[:search_title]    
    else
      @results=nil
    end
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js      
    end
  end  
  private
  def search_params
    if(!params.empty?)
      params.permit(:search_title)
    else
      nil
    end    
  end
end