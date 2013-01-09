class Book < ActiveRecord::Base
  belongs_to :datum
  attr_accessible :price, :datum_id, :seller_id, :buyer_id
	belongs_to :seller, :class_name => 'Person', :foreign_key => 'seller_id'
	belongs_to :buyer, :class_name => 'Person', :foreign_key => 'buyer_id'

	validates :price, :numericality => { :only_integer => true }
end
