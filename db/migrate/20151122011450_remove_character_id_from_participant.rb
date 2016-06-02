class RemoveCharacterIdFromParticipant < ActiveRecord::Migration
  def change
  	remove_column :participants, :charater_id
  end
end
