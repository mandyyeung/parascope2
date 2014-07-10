class CollectionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @articles = []
    Collection.all.each do |col|
        @articles << col.articles.all
    end
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.priority = 0
    respond_to do |format|
      if @collection.save
        current_user.collections << @collection
        format.html { redirect_to collection_path(@collection), notice: 'Collection was successfully added.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def upvote
    @collection = Collection.find(params[:collection_id])
    @collection.upvote
    redirect_to collections_path, notice: 'Collection was successfully upvoted.'
  end

  def downvote
    @collection = Collection.find(params[:collection_id])
    @collection.downvote
    redirect_to collections_path, notice: 'Collection was successfully downvoted.'
  end

  private
  def collection_params
    params.require(:collection).permit(:name, :id)
  end
end
