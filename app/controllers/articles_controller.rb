class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    # @articles = Article.all.limit(10)

    if params[:search].present?
      @articles = Article.es.search params[:search], page: params[:page]
      # @articles = @articles.results
    else
      @articles = Article.all.paginate(page: params[:page])
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.where(kba: params[:kba]).first
  end

  # GET /articles/new
  def new
    @article = Article.new

    if Article.kba_sort.last.nil?
      kba = 1
    else
      kba = Article.kba_sort.last.kba + 1
    end

    @article.kba = kba
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
        format.html { redirect_to kb_path(kba: @article.kba), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if article_params[:revision_notes].blank?
      respond_to do |format|
        @article.versionless do |article|
          if article.update(article_params)
            format.html { redirect_to kb_path(kba: @article.kba), notice: 'Article was successfully updated.' }
            format.json { render :show, status: :ok, location: @article }
          else
            format.html { render :edit }
            format.json { render json: @article.errors, status: :unprocessable_entity }
          end
        end
      end
    else
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to kb_path(kba: @article.kba), notice: 'Article was successfully updated.' }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
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
      params.require(:article).permit(:title, :kba, :keywords, :content, :revision_notes, :attachment)
    end
end
