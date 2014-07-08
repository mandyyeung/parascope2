class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to user_collection_path(:id), notice: 'Article was successfully added.' }
      else
        format.html { render action: 'new' }
      end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url, :user_id, :collection_id)
  end
end
