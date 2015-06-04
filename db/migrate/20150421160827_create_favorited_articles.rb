class CreateFavoritedArticles< ActiveRecord::Migration
  def change
    create_join_table :articles, :users do |t|
      t.references :article
      t.references :user

      t.boolean :is_favorite
      t.boolean :is_displayed
    end
  end
end
