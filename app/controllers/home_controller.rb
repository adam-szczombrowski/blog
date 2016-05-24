class HomeController < ApplicationController
  def welcome
    @articles = Article.all
  end

  def contact
  end
end
