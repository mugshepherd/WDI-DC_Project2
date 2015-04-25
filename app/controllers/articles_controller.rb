class ArticlesController < ApplicationController

  def set_active_nav(active_section="news")
    @active_class = "site-nav-active-span"
    @news_active, @sports_active, @life_active, @money_active, 
    @tech_active, @travel_active, @opinion_active = String.new
    case active_section
      when "news"
        @news_active = @active_class
      when "sports"
        @sports_active = @active_class
      when "life"
        @life_active = @active_class
      when "money"
        @money_active = @active_class
      when "tech"
        @travel_active = @active_class
      when "travel"
        @travel_active = @active_class
      when "opinion"
        @opinion_active = @active_class
    end
  end

  def index
    @articles = Article.all
  end

  def news
    Article.get_news(section="news")
    set_active_nav(active_section="news")
    @articles = Article.all
    render :index
  end

  def sports
    Article.get_news(section="sports")
    set_active_nav(active_section="sports")
    @articles = Article.all
    render :index
  end

  def life
    Article.get_news(section="life")
    set_active_nav(active_section="life")
    @articles = Article.all
    render :index
  end

  def money
    Article.get_news(section="money")
    set_active_nav(active_section="money")
    @articles = Article.all
    render :index
  end

  def tech
    Article.get_news(section="tech")
    set_active_nav(active_section="tech")
    @articles = Article.all
    render :index
  end

  def travel
    Article.get_news(section="travel")
    set_active_nav(active_section="travel")
    @articles = Article.all
    render :index
  end

  def opinion
    Article.get_news(section="opinion")
    set_active_nav(active_section="opinion")
    @articles = Article.all
    render :index
  end

end
