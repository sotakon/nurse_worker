class Job < ApplicationRecord
  belongs_to :corporation
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  validates :name, presence: true
  validates :area, presence: true
  validates :people, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :content, presence: true
end
