class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.order('created_at desc')
    .paginate(page: params[:page], per_page: 8).decorate
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      redirect_to root_path
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      redirect_to root_path
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:name, :content, :slug)
  end

  def find_article
    @article = Article.friendly.find(params[:id]).decorate
  end


end
