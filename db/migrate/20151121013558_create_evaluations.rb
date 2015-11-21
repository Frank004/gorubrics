class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.text :note
      t.integer :total_score
      t.references :participant, index: true, foreign_key: true
      t.references :member, index: true, foreign_key: true
      t.references :evaluation_builder, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
