class Score < ActiveRecord::Base
  belongs_to :participant
  belongs_to :event
  belongs_to :evaluation
  belongs_to :organization
end
