class CreateCriterions < ActiveRecord::Migration
  def change
    create_table :criterions do |t|
      t.string :name
      t.integer :points
      t.references :evaluation_builder, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
