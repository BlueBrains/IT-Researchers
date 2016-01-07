class CategoriesController < ApplicationController
  before_action :set_categories, only: [:show]
  before_action :set_cat
  def initialize
    @papers=nil    
  end
  def autocomplete
    render json: @categories
  end
  def index
  end 
  def show
    if(@papers.present?)
      render 'papers/index'
    else
      render :index
    end   
  end
  private
  def set_categories
    category=Category.find(params[:id])    
    if(category.present?)
      if(category.leaf?)
        @papers=category.papers.page(params[:page]).per(10)
      else
        @categories=category.children.page(params[:page]).per(10)
      end 
    else
      @categories=Category.roots.page(params[:page]).per(10)
    end    
  end
  def set_cat
    @categories = Category.all.page(params[:page]).per(10)
  end
end
