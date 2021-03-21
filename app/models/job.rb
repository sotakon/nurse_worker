class Job < ApplicationRecord
  validates :name, presence: true
  validates :area, presence: true
  validates :content, presence: true
end
