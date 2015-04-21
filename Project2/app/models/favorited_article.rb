class FavoritedArticle < ActiveRecord::Base
  validates_uniqueness_of :article_id, scope: :user_id

  has_many :articles
  has_many :users


end
