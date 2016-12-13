class CreateScholarsVideosJoin < ActiveRecord::Migration[5.0]

  def up
    create_table :scholars_videos, :id => false do |t|
      t.integer "scholar_id"
      t.integer "video_id"
    end
    add_index("scholars_videos", ["scholar_id", "video_id"])
  end

  def down
    drop_table :scholars_videos
  end

end
