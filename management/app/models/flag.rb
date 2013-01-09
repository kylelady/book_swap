class Flag < ActiveRecord::Base
  attr_accessible :key, :value

	validates :key, :presence
end
