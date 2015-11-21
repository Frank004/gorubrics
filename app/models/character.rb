class Character < ActiveRecord::Base
  belongs_to :participant
  belongs_to :event
  belongs_to :organization
end
