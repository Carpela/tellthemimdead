class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend
  
  validates_presence_of :user
  validates_presence_of :friend
end
