#require 'rubygems'
#require 'extensions'

# defines a USERS hash and REALM string
require 'users'

# defines an API_KEY string, with arbitrary url-safe characters
require 'api_key'

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

	def render_csv(filename = nil)
	  filename ||= params[:action]
	  filename += '.csv'

	  if request.env['HTTP_USER_AGENT'] =~ /msie/i
	    headers['Pragma'] = 'public'
	    headers["Content-type"] = "text/plain" 
	    headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
	    headers['Content-Disposition'] = "attachment; filename=\"#{filename}\"" 
	    headers['Expires'] = "0" 
	  else
	    headers["Content-Type"] ||= 'text/csv'
	    headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" 
	  end

	  render :layout => false
	end
	

	protected
		def authenticate
			if session[:timeout] == nil || (session[:timeout] - Time.now) > 0
				authenticate_or_request_with_http_digest(REALM) do |username|
					session[:tmpuser] = username
					USERS[username]
				end
			end
			logger.debug 'fooooo'
			session[:username] = session[:tmpuser]
			session[:admin] = session[:username] == 'admin' ? true : false
			session[:timeout] = Time.now + 1.hours
		end
end
