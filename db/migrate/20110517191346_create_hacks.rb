class CreateHacks < ActiveRecord::Migration
  def self.up
    create_table :hacks do |t|
      t.string :title
      t.string :repo_uri
      t.integer :hacker_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :hacks
  end
end
