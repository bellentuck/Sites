class CreateScholars < ActiveRecord::Migration[5.0]

  def up
    create_table :scholars do |t|
      t.string "name"
      #t.string "givenName"
      #t.string "familyName"
      #t.string "additionalName"
      t.string "jobTitle"  #e.g. "Associate Professor of English"
      t.string "affiliation" #university affiliation
      t.string "email"
      t.timestamps
    end
  end

  def down
    drop_table :scholars
  end

end
