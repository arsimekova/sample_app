class Comment < ActiveRecord::Base
  attr_accessible :comment, :user_id
  belongs_to :post
  belongs_to :user
  
  validates :post_id, presence:true
  validates_presence_of :user

	def shit(id)
		User.find_by_id(id).name
	end
end
