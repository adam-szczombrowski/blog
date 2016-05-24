class HomeController < ApplicationController
  def welcome
    @articles = Article.all.order('created_at desc')
  end

  def contact
  end
end
