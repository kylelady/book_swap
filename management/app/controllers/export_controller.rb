require 'rubygems'
require 'bundler/setup'

require 'csv'

class ExportController < ApplicationController
	skip_before_filter :authenticate


  def csv
		if params[:api] != API_KEY
			render :layout => false
			return
		end

		@book_data = Datum.all
		@csv = CSV.generate do |csv|
			@book_data.each do |bd|
				books = bd.books.select{|x| x.buyer == nil}
				csv << [ bd.course, bd.title, bd.author, bd.edition, bd.isbn, books.length, book_min(books), book_avg(books) ] unless books.length == 0
			end
		end

		respond_to do |wants|
			wants.csv do
				render_csv("export-#{Time.now.strftime('%Y%m%d%H%M%S')}")
			end
		end
  end

	protected
	helper_method :book_avg
	def book_avg(book_list)
		sum = 0
		book_list.each do |b|
			sum += b.price
		end
		sum / book_list.length
	end

	helper_method :book_min
	def book_min(book_list)
		min = book_list[0].price
		book_list.each do |b|
			min = b.price if b.price < min
		end
		min
	end
	helper_method :book_avg
	def book_avg(book_list)
		sum = 0
		book_list.each do |b|
			sum += b.price
		end
		sum / book_list.length
	end

	helper_method :book_min
	def book_min(book_list)
		min = book_list[0].price
		book_list.each do |b|
			min = b.price if b.price < min
		end
		min
	end

end
