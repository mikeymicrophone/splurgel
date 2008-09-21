class PostTopic < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :target, :polymorphic => true
end
