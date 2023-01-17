class Review < ApplicationRecord
  belongs_to :list

  validates :content, presence: true
  validates :rating, presence: true, length: { minum: 0, maximum: 5 }
end
