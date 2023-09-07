class User < ApplicationRecord
  has_many :tier_lists, dependent: :destroy
  has_many :tier_list_entiers, dependent: :destroy
  has_many :bookmark, dependent: :destroy
  mount_uploader :user_image, UserImageUploader
  mount_uploader :header_image, HeaderImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
