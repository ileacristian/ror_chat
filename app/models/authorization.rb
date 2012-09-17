class Authorization < ActiveRecord::Base
  attr_accessible :uid, :user_id, :provider
  belongs_to :user
end
