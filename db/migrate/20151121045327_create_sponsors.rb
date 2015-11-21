class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :priority
      t.string :contribution

      t.timestamps null: false
    end
  end
end
