class Book < ActiveRecord::Base
  belongs_to :datum
  attr_accessible :price, :datum_id
	has_one :seller
	has_one :buyer
end
