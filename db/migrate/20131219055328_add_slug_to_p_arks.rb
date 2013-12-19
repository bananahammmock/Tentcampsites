class AddSlugToPArks < ActiveRecord::Migration
  def change
  	add_column :parks, :slug, :string
  	add_column :campsites, :slug, :string
  end
end
