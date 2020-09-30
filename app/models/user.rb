class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  #has_many :comments, through posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # User Avatar Validation
   validates_integrity_of  :avatar
   validates_processing_of :avatar
  
   has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
   has_many :received_friends, through: :received_friendships, source: 'user'

   has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
   has_many :inverse_friends, :through => :inverse_friendships, :source => :user
   
   def active_friends
     friends.select{ |friend| friend.friends.include?(self) }  
   end
   
   def pending_friends
     friends.select{ |friend| !friend.friends.include?(self) }  
   end

   private
     def avatar_size_validation
       errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
     end
end
