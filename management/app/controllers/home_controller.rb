class HomeController < ApplicationController
	#skip_before_filter :authenticate, :only => [:index]
  def index
		@recv_en = Flag.find_by_key_and_value('receiving_enabled', true)
		@sell_en = Flag.find_by_key_and_value('selling_enabled', true)
  end
end
