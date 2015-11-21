class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :overall_score
      t.references :participant, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true
      t.references :evaluation, index: true, foreign_key: true
	  t.references :organization, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
