#require 'rubygems'
#require 'extensions'

# bootstrap the authorization system with one or more hardcoded usernames
# ex: USERS = ['nemcard', 'marysuec',]
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
			cosign_user = request.env['HTTP_X_REMOTE_USER']
p request.env
			if session[:timeout] == nil || (session[:timeout] - Time.now) > 0
				user = User.find_by_uniqname(cosign_user)
				if user and user.active
					session[:username] = user.uniqname
					session[:admin] = user.admin
				elsif USERS.include? cosign_user
					session[:username] = cosign_user
					session[:admin] = true
				else
					render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
				end
			end
			session[:timeout] = Time.now + 2.minutes
		end
end
