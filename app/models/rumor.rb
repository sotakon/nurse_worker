class Rumor < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :area, presence: true
    validates :content, presence: true
end
