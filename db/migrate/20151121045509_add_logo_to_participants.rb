class AddLogoToParticipants < ActiveRecord::Migration
  def change
    add_attachment :participants, :photo
  end
end
