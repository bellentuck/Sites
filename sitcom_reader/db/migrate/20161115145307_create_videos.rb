class CreateVideos < ActiveRecord::Migration[5.0]

  def up
    create_table :videos do |t|
      t.string "embedUrl"
      t.string "headline"
      t.string "caption"
      t.text "transcript"
      #t.string "interviewee"
      #t.string "interviewer"
      t.timestamps
    end
  end

  def down
    drop_table :videos
  end

end
