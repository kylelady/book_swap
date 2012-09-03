class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address1, :address2, :city, :state, :umid, :uniqname, :zip, :barcode
	has_many :selling_books, :class_name => "Book", :through => :sellers, :source => :book
	has_many :bought_books, :class_name => "Book", :through => :buyers, :source => :book
	has_many :sellers
	has_many :buyers
end
