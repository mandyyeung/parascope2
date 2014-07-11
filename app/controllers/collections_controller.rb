class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = []
    @collections = current_user.collections
    @collections.each do |col|
      @articles << col.articles.all.order("priority DESC")
    end
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(collection_params)
    if Collection.find_by_name(collection_params[:name])
      flash[:notice] = "#{collection_params[:name]} is already in use"
      render 'new'
    else
      current_user.collections << @collection
      respond_to do |format|
        if @collection.save
          format.html { redirect_to collection_path(@collection), notice: 'Collection was successfully added.' }
        else
          format.html { render action: 'new' }
        end
      end
    end
  end

  def show
    @collection = Collection.friendly.find(params[:id])
    unless current_user.collections.include?(@collection)
      redirect_to collections_path
    end
  end

  def update
  end

  def destroy
  end

  def archive
    @collections = current_user.collections
  end

  def upvote
    @collection = Collection.friendly.find(params[:collection_id])
    @collection.upvote
    redirect_to collections_path, notice: 'Collection was successfully upvoted.'
  end

  def downvote
    @collection = Collection.friendly.find(params[:collection_id])
    @collection.downvote
    redirect_to collections_path, notice: 'Collection was successfully downvoted.'
  end

  private
  def collection_params
    params.require(:collection).permit(:name, :id)
  end
end
