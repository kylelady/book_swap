class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address1, :address2, :city, :state, :umid, :uniqname, :zip, :barcode
	has_many :selling_books, :class_name => "Book", :foreign_key => 'seller_id'
	has_many :bought_books, :class_name => "Book", :foreign_key => 'buyer_id'
end
