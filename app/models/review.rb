class Review < ApplicationRecord
  belongs_to :user
  validates :created_on, uniqueness: true
  validates :content, length: { maximum: 200 }
end