class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :address1, :address2, :city, :state, :umid, :uniqname, :zip, :barcode
	has_many :selling_books, :class_name => "Book", :foreign_key => 'seller_id'
	has_many :bought_books, :class_name => "Book", :foreign_key => 'buyer_id'

	validates :uniqname, :uniqueness => true
	validates :umid, :uniqueness => true
	validates :uniqname, :length => { :in => 3..8 }
	validates :uniqname, :format => { :with => /\A[a-zA-Z]+\z/, :message => "does not have only letters" }
	validates :umid, :length => { :is => 8 }	
	validates :first_name, :length => { :minimum => 1 }
	validates :last_name, :length => { :minimum => 1 }
end
