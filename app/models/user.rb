class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  #has_many :comments, through posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
