class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :body, :limit => 20000
      t.boolean :published
      t.datetime :published_at
      t.integer :category_id

      t.timestamps
    end
  end
end
