class AddAvatarColumnsToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :articles, :avatar
  end
end
