class CreatePark < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.text :description
      t.integer :region_id

      t.timestamps
    end
  end
end