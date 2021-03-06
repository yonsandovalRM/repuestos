class ArticlesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all.last(30)
    end
    
    respond_to do |format|
      format.html { render :index }
      format.js {  }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @tags = Article.tag_counts_on(:tags)
  end
  def tags
    @tags = Article.tag_counts_on(:tags)
  end

  # GET /articles/new
  def new
    @article = Article.new
    respond_to do |format|
      format.html { render :new }
      format.js {  }
    end
  end

  def search_article
    @article_search = Article.find(params[:article_id])
    respond_to do |format|
      format.js { render "search.js.erb", location: @article_search }
    end
  end
  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.set_tag_list_on(:tags, article_params[:tag_list])
    respond_to do |format|
      if @article.save
        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |image|
            @article.pictures.create(image: image)
          }
        end
        format.html { redirect_to @article, notice: 'Artículo creado correctamente.' }
        format.json { render :show, status: :created, location: @article }
        format.js   { render "show.js.erb", location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
        format.js   { render :render }
      end
    end
  end
  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        @article.set_tag_list_on(:tags, article_params[:tag_list])
        @article.save
        if params[:images]
          # The magic is here ;)
          pictures = Picture.where(article_id: @article.id)
          pictures.each do |pic|
            pic.destroy
          end

          params[:images].each { |image|
            @article.pictures.create(image: image)
          }
        end
        format.html { redirect_to @article, notice: 'Artículo actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Artículo eliminado correctamente.' }
      format.json { head :no_content }
    end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:code,:tag_list, :description, :brand_id, :type_article_id, :type_vehicle_id, :type_format_id, :status, :applicant, :pin, :pou, :discount, :stock, :stock_store, :stock_min, :photo)
    end
end
