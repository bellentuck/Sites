class ChangeTranscriptFormat < ActiveRecord::Migration[5.0]

  def up
    remove_column "videos", "transcript"
    add_column "videos", "transcriptId", :string
  end

  def down
    remove_column "videos", "transcriptId"
    add_column "videos", "transcript", :text
  end

end
