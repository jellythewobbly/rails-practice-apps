class ArticlesController < ApplicationController
  before_action :find_article, only: %i[edit update show destroy]
  def index
    @articles = Article.all.order(:id)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'Article was successfully created'
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was successfully updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = 'Success, article was deleted'
    else
      flash[:danger] = 'ERROR 404, ARTICLE NOT FOUND'
    end
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
