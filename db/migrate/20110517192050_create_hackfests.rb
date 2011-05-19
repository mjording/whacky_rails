class CreateHackfests < ActiveRecord::Migration
  def self.up
    create_table :hackfests do |t|
      t.string :title
      t.string :city
      t.string :state
      t.string :country
      t.string :address
      t.float :lat
      t.float :lon
      t.datetime :starts
      t.datetime :ends
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :hackfests
  end
end
