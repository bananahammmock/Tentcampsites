class Park < ActiveRecord::Base
  belongs_to :region

  has_many :campsites
end
