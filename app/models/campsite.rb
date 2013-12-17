class Campsite < ActiveRecord::Base
	belongs_to :state
	belongs_to :region
end
