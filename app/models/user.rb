class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :rumors
  has_many :favorites, dependent: :destroy
  has_many :corporations_favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
      validates :name, presence: true
      validates :age, presence: true
      validates :area, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
