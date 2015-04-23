class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :link
      t.text :description
      t.text :image_url
      t.string :section
      t.decimal :xcoor
      t.decimal :ycoor
      t.timestamps null: false
    end
  end
end
