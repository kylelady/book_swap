class HomeController < ApplicationController
	#skip_before_filter :authenticate, :only => [:index]

  def index
		session[:person_id] = nil
  end

	def search
		@person = nil
		if params.has_key?(:barcode)
			@person = Person.find_by_barcode(params[:barcode])
		elsif params.has_key?(:umid)
			@person = Person.find_by_umid(params[:umid])
		elsif params.has_key?(:uniqname)
			@person = Person.find_by_uniqname(params[:uniqname])
		end
		if @person
			redirect_to :controller => :people, :action => :show, :id => @person.id
		else
			flash[:warning] = 'Not found'
			redirect_to :action => :index
		end
	end
end
