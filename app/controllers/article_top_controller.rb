class ArticleTopController < ApplicationController
  def index
    @articles = Article.order("view_count desc").limit(3)
  end

end
