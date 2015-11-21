class Evaluation < ActiveRecord::Base
  belongs_to :participant
  belongs_to :member, :judge, :class_name => "Member"
  belongs_to :evaluation_builder
  belongs_to :event
  belongs_to :organization
end
