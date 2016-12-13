class AddPermalinkToVideo < ActiveRecord::Migration[5.0]

  def up
    add_column "videos", "permalink", :string
  end

  def down
    remove_column "videos", "permalink", :string
  end

end
