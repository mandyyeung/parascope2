class ArticlesController < ApplicationController
  def new
    @collection = Collection.find(params[:collection_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.collections << Collection.find(params[:collection_id])
    respond_to do |format|
      if @article.save
        format.html { redirect_to user_collection_path(params[:user_id],params[:collection_id]), notice: 'Article was successfully added.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def archive
    article = Article.find(:id)
    article.archive
    redirect_to user_collection_path(params[:user_id],params[:collection_id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :url)
  end
end
