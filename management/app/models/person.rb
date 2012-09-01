class Person < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :state, :umid, :uniqname, :zip
end
