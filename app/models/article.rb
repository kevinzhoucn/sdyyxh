class Article < ActiveRecord::Base
  attr_accessible :body, :category_id, :published, :published_at, :title, :user_id
  belongs_to :category

  default_scope :order => 'published_at DESC'
  scope :recent, where(:published => true).limit(20)

  validates_presence_of :title
  validates_presence_of :body
  validates_length_of :title, :maximum => 255
  validates_length_of :body, :maximum => 20000

  before_save :update_published_at#, :random_file_name

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "/images/:style/missing.png", :whiny => false,
                    :url => "/uploadfiles/:class/:attachment/:id_partition/:basename_:style.:extension",
                    :path => ":rails_root/public/uploadfiles/:class/:attachment/:id_partition/:basename_:style.:extension"

  private
	  def update_published_at
	  	self.published_at = Time.now if published == true
	  end

    def random_file_name
      if File.extname(avatar_file_name).present?
        extension = File.extname(avatar_file_name).downcase
        self.avatar.instance_write(:file_name, "#{Time.now.strftime("%Y%m%d%H%M%S")}#{rand(1000)}#{extension}")
      end
    end
end
