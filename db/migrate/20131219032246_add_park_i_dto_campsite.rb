class AddParkIDtoCampsite < ActiveRecord::Migration
  def change
  	add_column :campsites, :park_id, :integer
  end
end
