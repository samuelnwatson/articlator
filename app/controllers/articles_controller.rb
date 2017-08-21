class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
      flash[:notice] = 'article created'
    else
      render 'new'
      flash[:notice] = 'article not created'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
      flash[:notice] = 'article updated'
    else
      render 'edit'
      flash[:notice] = 'article not updated'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'article destroyed'
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
