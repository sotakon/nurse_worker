class Comment < ApplicationRecord
  belongs_to :rumor
  validates :content, presence: true
end
