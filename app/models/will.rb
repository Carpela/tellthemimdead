class Will < ActiveRecord::Base
  belongs_to :user
  has_many :clauses, :class_name => 'WillClause'
  
  validates_presence_of :user
end
