class ArticlesController < ApplicationController
include ArticlesHelper
#before_action :require_login, except: [:show]
before_action :log_impressions, :only=> [:show]

    def log_impressions
        @article = Article.find(params[:id])
        a = @article.view_count
        if a == nil
            a = 1
        else
            a += 1
        end
    end

    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id

        if @article.view_count == nil
            Article.find(params[:id]).update_column(:view_count, 1)
        else
            Article.find(params[:id]).update_column(:view_count, @article.view_count + 1)
        end

        if @article.year_month_key == nil
            Article.find(params[:id]).update_column(:year_month_key, @article.created_at.to_s.slice(0,7))
        end
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new(article_params)
        @article.save
        flash.notice = "Article '#{@article.title}' Created!"
        redirect_to article_path(@article)
      
    end
    def destroy
        @article = Article.destroy(params[:id])
        flash.notice = "Article '#{@article.title}' Deleted!"
        redirect_to articles_path
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
      
        flash.notice = "Article '#{@article.title}' Updated!"


        redirect_to article_path(@article)
      end
      
end
