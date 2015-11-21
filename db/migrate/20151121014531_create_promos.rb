class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.string :title
      t.text :content
      t.datetime :start_date
      t.datetime :end_date
      t.references :event, index: true, foreign_key: true
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
