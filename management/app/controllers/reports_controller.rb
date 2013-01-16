require 'rubygems'
require 'bundler/setup'

require 'csv'

class ReportsController < ApplicationController
	def index
		@num_books = Book.all.count
		@num_unsold = Book.includes(:buyer_id).where(:buyer_id => nil).count
		@num_sold = @num_books - @num_unsold
	end
end
