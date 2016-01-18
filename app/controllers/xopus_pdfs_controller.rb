class XopusPdfsController < ApplicationController
  before_action :set_xopus_pdf, only: [:show, :edit, :update, :destroy]

  # GET /xopus_pdfs
  # GET /xopus_pdfs.json
  def index
    @xopus_pdfs = XopusPdf.all
  end

  # GET /xopus_pdfs/1
  # GET /xopus_pdfs/1.json
  def show
  end

  # GET /xopus_pdfs/new
  def new
    @xopus_pdf = XopusPdf.new
  end

  # GET /xopus_pdfs/1/edit
  def edit
  end

  # POST /xopus_pdfs
  # POST /xopus_pdfs.json
  def create
    @xopus_pdf = XopusPdf.new(xopus_pdf_params)

    respond_to do |format|
      if @xopus_pdf.save
        format.html { redirect_to @xopus_pdf, notice: 'Xopus pdf was successfully created.' }
        format.json { render :show, status: :created, location: @xopus_pdf }
      else
        format.html { render :new }
        format.json { render json: @xopus_pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xopus_pdfs/1
  # PATCH/PUT /xopus_pdfs/1.json
  def update
    respond_to do |format|
      if @xopus_pdf.update(xopus_pdf_params)
        format.html { redirect_to @xopus_pdf, notice: 'Xopus pdf was successfully updated.' }
        format.json { render :show, status: :ok, location: @xopus_pdf }
      else
        format.html { render :edit }
        format.json { render json: @xopus_pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xopus_pdfs/1
  # DELETE /xopus_pdfs/1.json
  def destroy
    @xopus_pdf.destroy
    respond_to do |format|
      format.html { redirect_to xopus_pdfs_url, notice: 'Xopus pdf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 def create_xml_temp
    #params[:uri]
    #current_researcher.to_s+
    if(params[:file].to_s=="document")
      save_path = Rails.root.join('public',current_researcher.id.to_s+'.xml')
    else
      save_path = Rails.root.join('public',params[:file].to_s+'_tmp.xml')
    end
    File.open(save_path, "w+") do |f|
      f.write(params[:doc])
    end
    render :nothing=>true
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xopus_pdf
      @xopus_pdf = XopusPdf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xopus_pdf_params
      params[:xopus_pdf]
    end


end
