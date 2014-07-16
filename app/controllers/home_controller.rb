class HomeController < ApplicationController
  def index
    if current_user
      @collection = current_user.collections.first
      @article = Article.new
    end
  end
end
