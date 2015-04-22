# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

topnews_key = "zjus29nccyrk765qc4sfz8qa"
articles_key = "phj2arhpxw9hjuqyfsw27ksc"

topnews_example = "http://api.usatoday.com/open/articles/topnews?api_key=" + topnews_key

def random_coord(min, max)
 rand * (max-min) + min
end

api_response = HTTParty.get(topnews_example)["rss"]["channel"]["item"]

api_response.each do |article|
  # puts article["guid"]["__content__"].inspect
  Article.create ({
    :title => article["title"],
    :description => article["description"],
    :link => article["link"],
    :guid => article["guid"]["__content__"],
    :xcoor => random_coord(37, 45),
    :ycoor => random_coord(-79, -70)
    })
end

# Article.create ({
#   :title => "Death penalty hearing begins for Boston Marathon bomber",
#   :description => "To get life sentence, lawyers must show his dysfunctional family and brother's dominance.",
#   :link => "http://www.usatoday.com/story/news/2015/04/21/jury-weighs-death-for-boston-bomber/26045747/",
#   :xcoor => 42.35854391749705,
#   :ycoor => -71.03759765625})

# Article.create ({
#   :title => "Interview: Anne Rice, author of 'Beauty's Kingdom'",
#   :description => "Jessie Potts chats with Anne Rice about the new Beauty's Kingdom in her Sleeping Beauty series.",
#   :link => "http://www.usatoday.com/story/happyeverafter/2015/04/21/anne-rice-interview-beautys-kingdom/26082253/",
#   :xcoor => 38.839707613545144,
#   :ycoor => -77.1240234375})

# Article.create ({
#   :title => "Ruble rebounds thanks to high Russian interest rates",
#   :description => "Analysts say stable oil prices and lower geopolitical risk are factors, too.",
#   :link => "http://www.usatoday.com/story/money/2015/04/21/russia-rubble-rebounds-high-interest-rates/26118743/",
#   :xcoor => 40.68896903762434,
#   :ycoor => -74.014892578125})
