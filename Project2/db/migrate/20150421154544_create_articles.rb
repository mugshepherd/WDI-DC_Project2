class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :link
      t.text :description
      t.text :guid

      t.timestamps null: false
    end
  end
end
