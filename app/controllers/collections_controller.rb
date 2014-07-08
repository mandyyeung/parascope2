class CollectionsController < ApplicationController
  def index
    @articles = []
    Collection.all.each do |col|
      @articles << col.articles.all
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
