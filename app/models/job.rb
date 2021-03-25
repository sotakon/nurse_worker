class Job < ApplicationRecord
  belongs_to :corporation
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  validates :name, presence: true
  validates :area, presence: true
  validates :content, presence: true
end
