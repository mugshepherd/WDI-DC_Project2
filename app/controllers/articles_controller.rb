class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def news
    Article.get_news(section="news")
    @articles = Article.all
    render :index
  end

  def sports
    Article.get_news(section="sports")
    @articles = Article.all
    render :index
  end

  def life
    Article.get_news(section="life")
    @articles = Article.all
    render :index
  end

  def money
    Article.get_news(section="money")
    @articles = Article.all
    render :index
  end

  def tech
    Article.get_news(section="tech")
    @articles = Article.all
    render :index
  end

  def travel
    Article.get_news(section="travel")
    @articles = Article.all
    render :index
  end

  def opinion
    Article.get_news(section="opinion")
    @articles = Article.all
    render :index
  end

  def weather
    Article.all.destroy_all
    Article.get_news(section="weather")
    @articles = Article.all
    render :index
  end

end
