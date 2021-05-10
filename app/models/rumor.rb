class Rumor < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :name, presence: true
	validates :area, presence: true
	validates :content, presence: true
end
