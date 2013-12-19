class Campsite < ActiveRecord::Base
	belongs_to :state
	belongs_to :region
	belongs_to :park
end
