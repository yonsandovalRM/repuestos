class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    respond_to do |format|
      format.html { render :index }
      format.js {  }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
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

    respond_to do |format|
      if @article.save
        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |image|
            @article.pictures.create(image: image)
          }
        end
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
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
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
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
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
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
      params.require(:article).permit(:code, :description, :brand_id, :type_article_id, :type_vehicle_id, :type_format_id, :status, :applicant, :pin, :pou, :discount, :stock, :stock_store, :stock_min, :photo)
    end
end
