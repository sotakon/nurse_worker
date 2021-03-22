class Job < ApplicationRecord
  belongs_to :corporation
  validates :name, presence: true
  validates :area, presence: true
  validates :content, presence: true
end
