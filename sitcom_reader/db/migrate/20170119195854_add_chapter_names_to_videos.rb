class AddChapterNamesToVideos < ActiveRecord::Migration[5.0]

  def up
    add_column "videos", "bookChapterTitle", :string
    add_column "videos", "visible", :boolean, :default => true
  end

  def down
    remove_column "videos", "bookChapterTitle"
    remove_column "videos", "visible"
  end

end
