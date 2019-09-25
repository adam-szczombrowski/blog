class HomeController < ApplicationController
  def welcome
    @articles = Article.all.order('created_at desc').limit(4).decorate
  end
end
