class Datum < ActiveRecord::Base
  attr_accessible :author, :edition, :isbn, :title, :course
	has_many :books

	validates :isbn, :presence => true
	validates :title, :presence => true
end
