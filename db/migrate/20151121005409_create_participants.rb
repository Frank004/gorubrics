class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :city
      t.string :email
      t.string :phone
      t.string :event_id
      t.integer :charater_id
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
