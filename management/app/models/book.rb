class Book < ActiveRecord::Base
  belongs_to :data
  attr_accessible :price
	has_one :seller
	has_one :buyer
end
