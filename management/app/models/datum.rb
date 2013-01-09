class Datum < ActiveRecord::Base
  attr_accessible :author, :edition, :isbn, :title, :course
	has_many :books

	validates :isbn, :presence
	validates :title, :presence
end
