class HomeController < ApplicationController
  def welcome
    @articles = Article.all.order('created_at desc').limit(4)
    @projects = Project.all.order('created_at desc').limit(4)
  end

  def contact
  end
end
