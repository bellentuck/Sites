class AddCourseCategoryToVideos < ActiveRecord::Migration[5.0]

  def up
    add_column "videos", "courseCategory", :string
  end

  def down
    remove_column "videos", "courseCategory", :string
  end

end
