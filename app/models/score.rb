class Score < ActiveRecord::Base
  belongs_to :participant
  belongs_to :event
  has_many   :evaluations , :through => :participant
  belongs_to :organization
end
