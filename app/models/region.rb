class Region < ActiveRecord::Base
	belongs_to :state
	has_many :campsites
	has_many :parks
end
