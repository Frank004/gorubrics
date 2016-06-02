class RemovePointsFromCriterions < ActiveRecord::Migration
  def change
  	remove_column :criterions, :points
  end
end
