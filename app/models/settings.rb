class Settings < ActiveRecord::Base
  attr_accessible :language, :user_id
  belongs_to :user
end
