class Datum < ActiveRecord::Base
  attr_accessible :author, :edition, :isbn, :title
	has_many :books
end
