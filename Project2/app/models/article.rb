class Article < ActiveRecord::Base

  has_many :favorited_articles
  has_many :users, through: :favorited_articles


end
