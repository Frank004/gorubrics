class Point < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :event
  belongs_to :organization
  belongs_to :criterion
end
