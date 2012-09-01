class Book < ActiveRecord::Base
  belongs_to :data
  attr_accessible :price
end
