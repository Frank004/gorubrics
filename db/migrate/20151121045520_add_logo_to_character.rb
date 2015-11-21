class AddLogoToCharacter < ActiveRecord::Migration
  def change
    add_attachment :characters, :photo
  end
end
