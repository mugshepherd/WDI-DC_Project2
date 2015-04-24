class Article < ActiveRecord::Base
  @@api_key = ENV['usa_today_articles_api_key']

  has_many :favorited_articles
  has_many :users, through: :favorited_articles

def self.get_news (query)
  def self.random_coord(min, max)
    rand * (max-min) + min
  end
  response = HTTParty.get(query)
  news = response["rss"]["channel"]["item"]
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
    query = "http://api.usatoday.com/open/articles/topnews?count=13&api_key=" + @@api_key
    get_news(query)
  end

  def self.add_metadata_all
    all.each do |article|
      article.add_metadata
    end
  end

  def add_metadata
    page_link = link.chomp("/") + ".json"
    site = page_link.split("/")[2].downcase
    if site == "www.usatoday.com"
      json = HTTParty.get(page_link)
      image_name = json["metadata_modules"][0]["asset_metadata"]["items"]["smallbasename"]
      image_baseurl = json["metadata_modules"][0]["asset_metadata"]["items"]["publishurl"]
      image_url = image_baseurl + image_name
      section = page_link.split("/")[5]
      update(image_url: image_url, section: section)
    else
      update(image_url: "https://dl.dropboxusercontent.com/u/7989543/general_assembly_logo/GeneralAssemblylogoRed.gif")
    end
  end

end
