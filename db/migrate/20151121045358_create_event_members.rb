class CreateEventMembers < ActiveRecord::Migration
  def change
    create_table :event_members do |t|
      t.references :member, index: true, foreign_key: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
