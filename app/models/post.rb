class Post < ActiveRecord::Base
  attr_accessible  :topic, :content

  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence:true

  default_scope order: 'posts.created_at DESC'

  def self.from_users_followed_by(user)
  	followed_user_ids = "SELECT followed_id FROM relationships
  						WHERE follower_id = :user_id"
  	where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
  						followed_user_ids: followed_user_ids, user_id: user)
  		
  end
end
