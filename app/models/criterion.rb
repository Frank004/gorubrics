class Criterion < ActiveRecord::Base
  belongs_to :evaluation_builder
  belongs_to :organization
end
