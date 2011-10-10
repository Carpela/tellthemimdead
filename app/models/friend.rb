class Friend < ActiveRecord::Base

  belongs_to :user
  
  has_one :message
  
  validates_presence_of :user

end
