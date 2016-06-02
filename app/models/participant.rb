class Participant < ActiveRecord::Base
  belongs_to :organization
  belongs_to :event
  has_one    :character, :dependent => :destroy
  has_one    :score, :dependent => :destroy
  has_many   :evaluations, :dependent => :destroy
  accepts_nested_attributes_for :character, allow_destroy: true

  validates :first_name, :presence => { :message => " no puede estar vacio" }
  validates :last_name, :presence => { :message => " no puede estar vacio" }

  after_create :create_score

	def full_name
	  "#{first_name.capitalize} #{last_name.capitalize}"
	end

	def create_score
		Score.create(participant_id: self.id, event_id: self.event.id, organization_id: self.event.organization.id)
	end

	def sumery_score
		pass_total_score_to_score = self.evaluations.map(&:total_score).reduce(:+) || 0
		score = self.score
		score.overall_score = pass_total_score_to_score
	end
end
