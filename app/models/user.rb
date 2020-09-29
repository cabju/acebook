class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  #has_many :comments, through posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # User Avatar Validation
   validates_integrity_of  :avatar
   validates_processing_of :avatar
  
   private
     def avatar_size_validation
       errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
     end
end
