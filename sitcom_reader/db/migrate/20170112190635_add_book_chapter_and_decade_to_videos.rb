class AddBookChapterAndDecadeToVideos < ActiveRecord::Migration[5.0]

  def up
    add_column "videos", "bookChapter", :integer
    add_column "videos", "bookSection", :string
  end

  def down
    remove_column "videos", "bookChapter", :integer
    remove_column "videos", "bookSection", :string
  end

end
