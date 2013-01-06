class User < ActiveRecord::Base
  attr_accessible :active, :admin, :uniqname
end
