class Person < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :state, :umid, :uniqname, :zip, :barcode
	has_many :selling_books, :class_name => "Book", :through => :seller
	has_many :bought_books, :class_name => "Book", :through => :buyer
end
