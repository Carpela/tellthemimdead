class Willclause < ActiveRecord::Base
  
  belongs_to :will
  belongs_to :friend
  belongs_to :stuff

  validates_presence_of :will
  validates_presence_of :friend
  validates_presence_of :stuff  
end
