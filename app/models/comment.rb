class Comment < ActiveRecord::Base
  attr_accessible :comment
  belongs_to :post
  validates :post_id, presence:true
end
