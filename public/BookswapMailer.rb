class BookswapMailer <ActionMailer::Base
	default:from=>"TBP Bookswap <tbp-bookswap-web@umich.edu>"
	@bookswap.location= "EECS Lounge"
	@bookswap.check_dates="Thursday, Sept. 13 and Friday, Sept. 14 between 10am and 5pm"
	def book_sold_email(person)
		email_recipient="#{person.name} <#{person.uniqname}@umich.edu>"
		email_subject ="[TBP Bookswap] Sold Book Notification"
		mail(:to =>email_recipient, :subject=>email_subject)
	end
end