class Organization < ActiveRecord::Base
  has_many :members, :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :categories, :dependent => :destroy
	has_many :evaluations, :through => :events
	has_many :evaluation_builders, :through => :events
	has_many :participants, :through => :events
	has_many :scores, :through => :events
  has_many :participants, :through => :events
	has_many :characters, :through => :events
	has_many :criterions, :through => :events
	has_many :promos, :through => :events
	has_many :sponsors, :through => :events
	# has_many :points, :through => :events
end
