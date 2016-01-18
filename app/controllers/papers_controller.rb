class PapersController < ApplicationController 
  before_action :set_researcher
  before_action :set_paper, only: [:show, :edit, :update, :destroy,:flag_it]
  load_and_authorize_resource

  def index
    @papers = @researcher.papers.page(params[:page]).per(8)
  end

  def show
    if(@paper.active==true)
      @paper.seen=true
      @paper.state = "published"
      @paper.save!
    end  
    document = Nokogiri::XML(File.read(Rails.root.to_s+'/public/'+@paper.id.to_s+'.xml'))
    template = Nokogiri::XSLT(File.open(Rails.root.to_s+'/public/xopus/examples/simple/xsl/stylesheet.xsl','rb'))
    @html_document = template.transform(document)    
    @related_papers = @paper.similar.limit(3)
  end

  def new    
    @paper = Paper.new
    @post_attachment = @paper.post_attachments.build
    #response.headers.delete "X-Frame-Options"
  end

  def edit
  end

  def create
    @paper = @researcher.papers.new(paper_params)    
    @paper.category = Category.find(params[:category])
    respond_to do |format|      
      if @paper.save
        params[:paper][:researcher_ids].shift
        if !params[:paper][:researcher_ids].nil?
          params[:paper][:researcher_ids].each do |res|
            researcher = Researcher.find(res)
            @paper.researchers.push(researcher)
          end
        end
        @paper.seen = false
        @paper.save!
        if !params[:post_attachments].nil?
          params[:post_attachments]['file'].each do |a|
            @post_attachment = @paper.post_attachments.create!(:file => a)
          end
        end
        require "rexml/document"
          xmlfile = File.new(Rails.root.join('public',current_researcher.id.to_s+'.xml'))
          @xmldoc = REXML::Document.new(xmlfile)
          @paper.title = @xmldoc.get_elements('article/title')[0].to_s.gsub(/<\/?[^>]+>/, '')
          @paper.abstract = @xmldoc.get_elements('article/abstract')[0].to_s.gsub(/<\/?[^>]+>/, '')
          @paper.introduction = @xmldoc.get_elements('article/introduction')[0].to_s.gsub(/<\/?[^>]+>/, '')
          @paper.save

          save_path = Rails.root.join('public',@paper.id.to_s+'.xml')
          File.open(save_path, "w+") do |f|
            f.write(@xmldoc)
          end      

        format.html { redirect_to [@researcher,@paper], notice: 'تم نشر المقالة بنجاح.' }
        format.json { render :show, status: :created, location: @paper }          
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end        
  end

   def download
      document = Nokogiri::XML(File.read(Rails.root.to_s+'/public/'+params[:paper_id].to_s+'.xml'))
      template = Nokogiri::XSLT(File.open(Rails.root.to_s+'/public/xopus/examples/simple/xsl/stylesheet.xsl','rb'))
      #render text:document

      #options = { toc: { xsl_style_sheet: Rails.root.join('/xopus/examples/rich-text/xsl', 'stylesheet.xsl').to_s } }
      #pdf = WickedPdf.new.pdf_from_string(document, options)


      html_document = template.transform(document)
      #render :text =>document
      pdf = WickedPdf.new.pdf_from_string(html_document)
       send_data(pdf, 
      :filename    => "my_pdf_name.pdf", 
      :disposition => 'attachment')
  end

#for test purposes
  # def koko 
  #    require "rexml/document"
  #     xmlfile = File.new(Rails.root.join('public','5675ba2c8db1b01b0c000001.xml'))
  #     @xmldoc = REXML::Document.new(xmlfile)       
  #     render :layout=>false     
  # end  

  def flag_it
    @flag=@paper.flags.new(params[:reason])
    @flag.save
  end

  def update
    respond_to do |format|      
      if @paper.update(paper_params)
        params[:paper][:researcher_ids].shift
        if !params[:paper][:researcher_ids].nil?
          @paper.researcher_ids.clear
          @paper.researchers.push(current_researcher)
          params[:paper][:researcher_ids].each do |res|
            researcher = Researcher.find(res)
            @paper.researchers.push(researcher)
          end
        end
        if !params[:post_attachments].nil?
          params[:post_attachments]['file'].each do |a|
            @post_attachment = @paper.post_attachments.create!(:file => a)
          end
        end

        require "rexml/document"
          xmlfile = File.new(Rails.root.join('public',@paper.id.to_s+'_tmp.xml'))
          @xmldoc = REXML::Document.new(xmlfile)
          @paper.title = @xmldoc.get_elements('article/title')[0].to_s.gsub(/<\/?[^>]+>/, '')
          @paper.abstract = @xmldoc.get_elements('article/abstract')[0].to_s.gsub(/<\/?[^>]+>/, '')
          @paper.introduction = @xmldoc.get_elements('article/introduction')[0].to_s.gsub(/<\/?[^>]+>/, '')
          @paper.save

          save_path = Rails.root.join('public',@paper.id.to_s+'.xml')
          File.open(save_path, "w+") do |f|
            f.write(@xmldoc)
          end 

        format.html { redirect_to [@researcher,@paper], notice: 'تم تعديل المقالة بنجاح.' }
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
      format.html { redirect_to researcher_papers_url(@researcher), notice: 'تم حذف المقالة بنجاح.' }
      format.json { head :no_content }
    end
  end

  def find_by_tag
    @results = Paper.with_all_tags(params[:tag]).page(params[:page]).per(8)
    render :file => "papers/_tags"
  end

  private
    # Use callbacks to share common setup or constraints between actions.    
    def set_researcher      
      @researcher = current_researcher
    end

    def set_paper
      if(@researcher.present?)
        @paper = @researcher.papers.find(params[:id])
      else
        @paper=Paper.find(params[:id])
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params      
      params.require(:paper).permit(:category, :title, :abstract, :introduction, :literature_survey, 
      :notation, :theory, :specification, :implementation,
      :valuation, :related_work, :further_work, :conclusion, :appendices, :state, :tags, :researcher_ids, :keywords)
    end

end
