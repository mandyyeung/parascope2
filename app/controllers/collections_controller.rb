class CollectionsController < ApplicationController
  def index
    @collection = Collection.find_by_name("Unsorted") ? Collection.find_by_name("Unsorted") : Collection.create(name: "Unsorted")
    @articles = []
    if @collection.articles.count > 0
      @collection.articles.each do |col|
        @articles << col.articles.all
      end
    end
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
