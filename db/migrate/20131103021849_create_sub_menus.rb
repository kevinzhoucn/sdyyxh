class CreateSubMenus < ActiveRecord::Migration
  def change
    create_table :sub_menus do |t|
      t.string :name
      t.integer :article_id
      t.integer :category_id

      t.timestamps
    end
  end
end
