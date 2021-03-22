class User < ApplicationRecord
  has_many :rumors
  has_many :favorites, dependent: :destroy
  has_many :corporations_favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
