class User < ActiveRecord::Base
  has_many :favorited_articles
  has_many :articles, through: :favorited_articles

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
