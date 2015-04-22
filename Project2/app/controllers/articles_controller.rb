class ArticlesController < ApplicationController

  @secret_key_articles = ENV['usa_today_articles_api_key']

  def index
    @articles = Article.all
	end

	def show
		@article = Article.find( params[:id] )

	end

	# def api_top_articles
  #
	# 	# @article = Article.new
	# 	# search_array = params[:search].split(' ')
	# 	# search_array.join('+')
	# 	@articles = HTTParty.get("http://api.usatoday.com/open/articles?keyword=#{params[:search]}&api_key=#{@secret_key_articles}")
	# end
  #
  # def favorites
  #   @article = current_user.favorite_articles
  #   render :index
  # end

end
