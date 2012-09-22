class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_one :authorization
  has_one :settings
end
