class Scholar < ApplicationRecord

  has_and_belongs_to_many :videos

  scope :sorted, lambda { order("name ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }

end
