class CreateHackers < ActiveRecord::Migration
  def self.up
    create_table :hackers do |t|
      t.string :name
      t.float :irony_value
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :hackers
  end
end
