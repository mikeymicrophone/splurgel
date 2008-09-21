class BlogPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  belongs_to :post
end
