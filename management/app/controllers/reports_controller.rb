require 'rubygems'
require 'bundler/setup'

require 'csv'

class ReportsController < ApplicationController
	def index
		@num_books = Book.all.count
		@num_unsold = Book.includes(:buyer_id).where(:buyer_id => nil).count
		@num_sold = @num_books - @num_unsold
	end

	def sellers
		@uniqnames = ActiveRecord::Base.connection.select_all('SELECT DISTINCT(uniqname) FROM people JOIN books ON people.id = books.seller_id')

    respond_to do |format|
      format.html # sellers.html.erb
		end
	end

	def soas_csv
		ids = ActiveRecord::Base.connection.select_all('SELECT DISTINCT(people.id) FROM people JOIN books ON people.id = books.seller_id WHERE books.buyer_id IS NOT NULL')
		@people = []
		ids.each do |id_|
			person = Person.find_by_id(id_['id'])
			@people.append(person)			
		end

		@csv = ''
		@people.each do |person|
			total = 0
			@books = Book.where(person: person)
			next unless @books
			@books.each do |book|
				next if book.buyer == nil
				total = total + book.price
			end
			
			CSV.generate_row([person.first_name, 
												'',
												person.last_name,
												person.address1,
												person.address2,
												person.city,
												person.state,
												person.zip,
												total],
												9, @csv)
		end

		respond_to do |wants|
			wants.csv do
				render_csv("soas-#{Time.now.strftime('%Y%m%d%H%M%S')}")
			end
		end
	end
end
