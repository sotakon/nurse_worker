class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :jobs, through: :labellings
end
