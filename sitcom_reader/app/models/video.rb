class Video < ApplicationRecord

  has_and_belongs_to_many :scholars

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("headline ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }

  # filter searches by course category:
  scope :category_search, lambda { |query| where(courseCategory: query) }

  # get videos corresponding to articles about a particular decade
  scope :decade_search, lambda { |query| where(bookSection: query) }

  # get particular titles
  scope :title_search, lambda { |query| where(headline: query) }

  # order book Chapters
  scope :book_order, lambda { order("bookChapter ASC") }



  # scope :videos_culture_sitcom, lambda { Video.where(["courseCategory LIKE ?", "Culture and the Sitcom"]) }
  #
  # scope :videos_com_318, lambda { Video.where(["courseCategory LIKE ?", "COM 318 Videos"]) }


  # radio_button("post", "category", "java")
  #       <%= radio_button_tag(:courseCategory, "culture_and_the_sitcom") %>
  #       <%= label_tag(:culture_and_the_sitcom, "Culture and the Sitcom") %>
  #       <%= radio_button_tag(:courseCategory, "com_318_videos") %>
  #       <%= label_tag(:com_318_videos, "COM 318 Videos") %>
  #     </td>

  has_permalink :headline
  #acts_as_permalink from: :headline, max_length: 255

  # validates_presence_of :permalink
  # validates_length_of :permalink, :within => 3..255
  # validates_uniqueness_of :permalink
  # :message => 'Permalink = title - punctuation + dash-in-between-every-word. E.g., "Egis Hampel: Singing in the Rain" (title) becomes "egis-hampel-singing-in-the-rain" (permalink). Permalinks are case-insensitive. They should be 3-255 characters long.'

end
