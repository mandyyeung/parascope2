class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def new
    @collection = Collection.find(params[:collection_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.priority = 0
    @article.collections << Collection.find(params[:article][:collection_ids])
    respond_to do |format|
      if @article.save
        format.html { redirect_to collection_path(params[:article][:collection_ids]), notice: 'Article was successfully added.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def archive
    article = Article.find(params[:id])
    article.archive
    redirect_to '/collections/1', notice: 'Article was successfully archived.'
  end

  def upvote
    @article = Article.find(params[:article_id])
    @article.upvote
    redirect_to :back, notice: 'Article was successfully upvoted.'
  end

  def downvote
    @article = Article.find(params[:article_id])
    @article.downvote
    redirect_to :back, notice: 'Article was successfully downvoted.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :url, :collection_ids => [])
  end
end
