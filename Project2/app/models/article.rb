class Article < ActiveRecord::Base

  has_many :favorited_articles
  has_many :users, through: :favorited_articles

  def search
		search_array = params[:search].split(' ')
		search_array.join('+')
		@article_search =
     HTTParty.get("http://api.usatoday.com/open/articles?keyword=#{params[:search]}&api_key=zjus29nccyrk765qc4sfz8qa")



end


end
