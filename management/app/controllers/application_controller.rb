#require 'rubygems'
#require 'extensions'

# defines a USERS hash and REALM string
require 'users'

class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :authenticate

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
