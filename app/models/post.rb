class Post < ActiveRecord::Base
  belongs_to :user
  has_many :blog_posts
  has_many :blogs, :through => :blog_posts
  has_many :post_topics
end
