class User < ActiveRecord::Base
  include LoginEngine::AuthenticatedUser
  # all logic has been moved into login_engine/lib/login_engine/authenticated_user.rb
  
  # add field
  attr_accessor :rememberme
  
  # relations
  has_many :stores
  has_many :favorites
end

