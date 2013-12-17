class CreateCampsites < ActiveRecord::Migration
  def change
    create_table :campsites do |t|
      t.string :name
      t.text :description
      t.integer :state_id
      t.integer :region_id

      t.timestamps
    end
  end
end
