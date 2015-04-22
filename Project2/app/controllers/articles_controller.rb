class ArticlesController < ApplicationController
  def index
    @articles = Article.all
	end

	def show
		@article = Article.find( params[:id] )

	end

	def search
    secret_key = ENV['usa_today_api_key']
		# @article = Article.new
		# search_array = params[:search].split(' ')
		# search_array.join('+')
		@articles = HTTParty.get("http://api.usatoday.com/open/articles?keyword=#{params[:search]}&api_key=#{secret_key}")
	end

  def favorites
    @article = current_user.favorite_articles
    render :index
  end

end
