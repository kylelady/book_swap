#require 'rubygems'
#require 'extensions'

# defines a USERS hash and REALM string
require 'users'

class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :authenticate

	helper_method :recv_en?
	def recv_en?
		Flag.find_by_key_and_value('receiving_enabled', true)
	end

	helper_method :sell_en?
	def sell_en?
		Flag.find_by_key_and_value('selling_enabled', true)
	end

	protected
		def authenticate
			session[:username] = nil
			session[:admin] = false
			authenticate_or_request_with_http_digest(REALM) do |username|
				session[:tmpuser] = username
				USERS[username]
			end
			logger.debug 'fooooo'
			session[:username] = session[:tmpuser]
			session[:admin] = true if session[:username] == 'admin'
		end
end
