class Event < ActiveRecord::Base
  belongs_to :organization
  has_many :participants, :dependent => :destroy
  has_many :characters, :dependent => :destroy
  has_many :evaluations, :dependent => :destroy
  has_many :evaluation_builders, :dependent => :destroy
  has_many :criterions, :through => :evaluation_builders
  has_many :promos, :dependent => :destroy
  has_many :scores, :dependent => :destroy    
  has_many :event_sponsors, :dependent => :destroy
  has_many :sponsors, :through => :event_sponsors

scope :close, lambda {where(:status => true)}
scope :open, lambda {where(:status => false)}


  def its_close?
    if self.end_date < Time.now
       self.status = true
       self.save
    end
  end

end
