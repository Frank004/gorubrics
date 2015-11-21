class Category < ActiveRecord::Base
  belongs_to :organization
  has_many :evaluation_builders
end
