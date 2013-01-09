class User < ActiveRecord::Base
  attr_accessible :active, :admin, :uniqname

	validates :uniqname, :length => { :in => 3..8 }
	validates :uniqname, :format => { :with => /\A[a-zA-Z]+\z/, :message => "does not have only letters" }
end
