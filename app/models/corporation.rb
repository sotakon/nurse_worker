class Corporation < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :jobs
  has_many :corporations_favorites, dependent: :destroy
      validates :name, presence: true
      validates :area, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :current_password
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
