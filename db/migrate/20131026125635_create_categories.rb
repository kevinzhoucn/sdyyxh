# encoding: utf-8

class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :own_id
      t.integer :display_order
      t.boolean :fixed_menu
      t.integer :submenu_of

      t.timestamps
    end

    news_category = Category.create(:name => "网站新闻", :own_id => 0, :display_order => 0)
    change_column :articles, :category_id, :integer, :default => news_category

    Category.create(name: '协会介绍', own_id: 1, display_order:1, fixed_menu: true)
    Category.create(name: '政策法规', own_id: 2, display_order:2, fixed_menu: true)
    Category.create(name: '会员名录', own_id: 3, display_order:3, fixed_menu: true)
    Category.create(name: '动态资讯', own_id: 4, display_order:4, fixed_menu: true)
    Category.create(name: '剧场信息', own_id: 5, display_order:5, fixed_menu: true)
    Category.create(name: '演出票务', own_id: 6, display_order:6, fixed_menu: true)
    Category.create(name: '艺术团体', own_id: 7, display_order:7, fixed_menu: true)
    Category.create(name: '联系我们', own_id: 8, display_order:8, fixed_menu: true)

    category = Category.find_by_own_id(4)
    Category.create(name: '近期公告', own_id: 9, submenu_of: category.id)
    Category.create(name: '新闻动态', own_id: 10, submenu_of: category.id)
    Category.create(name: '演出动态', own_id: 11, submenu_of: category.id)
  end
end