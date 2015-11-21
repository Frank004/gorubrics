class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :phone
      t.string :city
      t.string :country
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :instagram

      t.timestamps null: false
    end
  end
end
