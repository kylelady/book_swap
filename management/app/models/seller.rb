class Seller < ActiveRecord::Base
  belongs_to :person
  belongs_to :book
  # attr_accessible :title, :body
end
