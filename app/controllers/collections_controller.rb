class CollectionsController < ApplicationController
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
    respond_to do |format|
      if @collection.save
        current_user.collections << @collection
        format.html { redirect_to user_collection_path(current_user,@collection), notice: 'Collection was successfully added.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def collection_params
    params.require(:collection).permit(:name, :id)
  end
end
