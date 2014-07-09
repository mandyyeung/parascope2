class ArticlesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @collection = Collection.find(params[:collection_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.collections << Collection.find(params[:collection_id])
    respond_to do |format|
      if @article.save
        binding.pry
        format.html { redirect_to user_collection_path(article_params[:user_id],article_params[:collection_id]), notice: 'Article was successfully added.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :url)
  end
end
