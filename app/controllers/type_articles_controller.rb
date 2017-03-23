class TypeArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_type_article, only: [:show, :edit, :update, :destroy]

  # GET /type_articles
  # GET /type_articles.json
  def index
    @type_articles = TypeArticle.all
  end

  # GET /type_articles/1
  # GET /type_articles/1.json
  def show
  end

  # GET /type_articles/new
  def new
    @type_article = TypeArticle.new
  end

  # GET /type_articles/1/edit
  def edit
  end

  # POST /type_articles
  # POST /type_articles.json
  def create
    @type_article = TypeArticle.new(type_article_params)

    respond_to do |format|
      if @type_article.save
        format.html { redirect_to @type_article, notice: 'Tipo de artículo creado correctamente.' }
        format.json { render :show, status: :created, location: @type_article }
      else
        format.html { render :new }
        format.json { render json: @type_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_articles/1
  # PATCH/PUT /type_articles/1.json
  def update
    respond_to do |format|
      if @type_article.update(type_article_params)
        format.html { redirect_to @type_article, notice: 'Tipo de artículo actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @type_article }
      else
        format.html { render :edit }
        format.json { render json: @type_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_articles/1
  # DELETE /type_articles/1.json
  def destroy
    @type_article.destroy
    respond_to do |format|
      format.html { redirect_to type_articles_url, notice: 'Type article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_article
      @type_article = TypeArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_article_params
      params.require(:type_article).permit(:name)
    end
end
