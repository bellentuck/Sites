class Video < ApplicationRecord

  has_and_belongs_to_many :scholars

  scope :sorted, lambda { order("headline ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }

  has_permalink :headline
  #acts_as_permalink from: :headline, max_length: 255

  # validates_presence_of :permalink
  # validates_length_of :permalink, :within => 3..255
  # validates_uniqueness_of :permalink
  # :message => 'Permalink = title - punctuation + dash-in-between-every-word. E.g., "Egis Hampel: Singing in the Rain" (title) becomes "egis-hampel-singing-in-the-rain" (permalink). Permalinks are case-insensitive. They should be 3-255 characters long.'

end
