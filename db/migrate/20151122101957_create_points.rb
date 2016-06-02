class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :criterion_value
      t.references :evaluation, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true
      t.references :criterion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
