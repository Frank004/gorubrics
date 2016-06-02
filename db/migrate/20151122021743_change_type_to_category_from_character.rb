class ChangeTypeToCategoryFromCharacter < ActiveRecord::Migration
  def change
  	rename_column :characters, :type, :category
  end
end
