class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :blog_posts
  has_many :posts, :through => :blog_posts
end
