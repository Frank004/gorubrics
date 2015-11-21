class Participant < ActiveRecord::Base
  belongs_to :organization
  belongs_to :event
  has_one :charater
  has_many :evaluations, :dependent => :destroy
end
