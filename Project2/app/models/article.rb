class Article < ActiveRecord::Base

  has_many :favorited_articles
  has_many :users, through: :favorited_articles

  def search
		search_array = params[:search].split(' ')
		search_array.join('+')
		@article_search =
     HTTParty.get("http://api.usatoday.com/open/articles?keyword=#{params[:search]}&api_key=ENV['project2_api_key']")
  end


   def self.random_coord(min, max)
     rand * (max-min) + min
   end


  def self.get_news (query)
   api_key = ENV['usa_today_articles_api_key']
   response = HTTParty.get(query)

   news  = response["rss"]["channel"]["item"]
   news.each do |article|
     create ({
       :title => article["title"],
       :description => article["description"],
       :link => article["link"],
       :xcoor => random_coord(37, 45),
       :ycoor => random_coord(-79, -70)
       })
     end
   end

   def self.get_topnews
     query = "http://api.usatoday.com/open/articles/topnews?count=10&api_key=" + api_key
     get_news(query)
   end

   def add_metadata
     page_link = self.link.chomp("/") + ".json"
     json = HTTParty.get(page_link)
     small_image_url = json["assets"]["items"]["smallbasename"]

   end

  end
