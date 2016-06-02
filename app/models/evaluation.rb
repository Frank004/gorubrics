class Evaluation < ActiveRecord::Base
  belongs_to :participant
  belongs_to :judge , :class_name => "Member"
  belongs_to :evaluation_builder
  belongs_to :event
  belongs_to :organization
  has_many :points, :dependent => :destroy
  has_many :criterions, :through => :evaluation_builder
  accepts_nested_attributes_for :evaluation_builder
  accepts_nested_attributes_for :criterions
  accepts_nested_attributes_for :points
  # callbacks
  before_create :collect_scores

  def collect_scores
    self.total_score = self.points.map(&:criterion_value).reduce(:+) || 0
  end
end 