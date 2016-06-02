class RemoveEvaluationIdFromScores < ActiveRecord::Migration
  def change
  	remove_column :scores, :evaluation_id
  end
end
