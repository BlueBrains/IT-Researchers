class HomeController < ApplicationController
 before_action :set_paper, only: [:show]

  def index  	  	
  	@researchers = Researcher.all
    @papers=Paper.all.limit(8)       
  end
    
  def show
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
