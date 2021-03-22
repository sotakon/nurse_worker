class CorporationsFavorite < ApplicationRecord
  belongs_to :corporation
  belongs_to :user
end
