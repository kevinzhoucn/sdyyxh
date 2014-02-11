class Category < ActiveRecord::Base
  attr_accessible :name, :own_id, :display_order, :fixed_menu, :submenu_of
  
  default_scope :order => 'display_order'

  has_many :articles, :dependent => :nullify
  has_many :sub_menus, :dependent => :nullify

  validates_length_of :name, :maximum => 80

  def Category.nav_menu
  	menus = Category.where(:fixed_menu => true)
  end

  def Category.s_menu(item)
  	s_menus = Category.where(:submenu_of => item.id)
  end

  def get_recent_article
    articles.where(:published => true).limit(20)
  end
end
