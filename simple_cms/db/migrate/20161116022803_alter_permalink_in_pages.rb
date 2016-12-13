class AlterPermalinkInPages < ActiveRecord::Migration[5.0]

  def up
    remove_column :pages, :permalink, :integer
    add_column :pages, :permalink, :string
  end

  def down
    remove_column :pages, :permalink, :string
    add_column :pages, :permalink, :integer
  end
end
