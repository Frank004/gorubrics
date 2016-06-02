class Criterion < ActiveRecord::Base
  belongs_to :evaluation_builder
  belongs_to :organization
  has_many :evaluation, :through => :evaluation_builder
  has_many :points
end
