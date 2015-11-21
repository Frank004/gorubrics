class Sponsor < ActiveRecord::Base
    has_many :event_sponsors, :dependent => :destroy
    has_many :event, :through => :event_sponsors
    belongs_to :organization
end
