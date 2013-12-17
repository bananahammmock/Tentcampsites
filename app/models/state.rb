class State < ActiveRecord::Base
	has_many :regions
	has_many :campsites
end
