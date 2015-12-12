class PapersController < ApplicationController

  before_action :set_researcher
  before_action :set_paper, only: [:show, :edit, :update, :destroy]

  def index
    @papers = @researcher.papers.page(params[:page]).per(8)
  end

  def show
  end

  def new
    @paper = Paper.new
  end

  def edit
  end

  def create
    @paper = current_researcher.papers.new(paper_params)

    respond_to do |format|
      if @paper.save
        format.html { redirect_to [@researcher,@paper], notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to [@researcher,@paper], notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to researcher_papers_url(@researcher), notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.    
    def set_researcher
      @researcher = current_researcher
    end

    def set_paper
      @paper = current_researcher.papers.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params      
      params.require(:paper).permit(:title, :content, :state)
    end

end
