class ArticlesController < ApplicationController::Base
  def index

  	end

  	def show
  		@article = Article.find(params[:id])
      @user =
  	end

  	def search
  		# @article = Article.new
  		search_array = params[:search].split(' ')
  		search_array.join('+')
  		@movie_search = HTTParty.get("http://api.usatoday.com/open/articles?keyword=#{params[:search]}&api_key=zjus29nccyrk765qc4sfz8qa")
  	end

    def favorite
      @article = Article.find(params[:id])
      @user = User.find(params[:id])

  end
