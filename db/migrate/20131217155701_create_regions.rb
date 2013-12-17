class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.text :description
      t.integer :state_id

      t.timestamps
    end
  end
end
