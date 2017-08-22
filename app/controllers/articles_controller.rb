class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @articles = Article.search(params[:search]).order("created_at DESC")
      flash[:notice] = "found #{@articles.count} matches"
    else
      @articles = Article.all
    end
  end

  def show
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    @article.user = current_user

    if @article.save
      redirect_to @article
      flash[:notice] = 'article created'
    else
      flash.now[:alert] = 'article not created'
      render 'new'
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      redirect_to @article
      flash[:notice] = 'article updated'
    else
      flash.now[:alert] = 'article not updated'
      render 'edit'
    end
  end

  def destroy
    authorize @article
    @article.destroy
    flash[:alert] = 'article destroyed'
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
