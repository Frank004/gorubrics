class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :series
      t.string :type
      t.references :participant, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true


      t.timestamps null: false
    end
  end
end
