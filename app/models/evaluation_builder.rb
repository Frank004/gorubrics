class EvaluationBuilder < ActiveRecord::Base
  belongs_to :event
  belongs_to :organization
  belongs_to :category
  has_many :criterions, :dependent => :destroy
  accepts_nested_attributes_for :criterions, allow_destroy: true


  def category_name
  	"#{self.name} #{self.category.name}".parameterize
  end
end
