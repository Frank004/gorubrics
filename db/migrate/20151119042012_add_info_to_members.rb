class AddInfoToMembers < ActiveRecord::Migration
  def change
    add_column :members, :first_name, :string
    add_column :members, :last_name, :string
    add_column :members, :city, :string
    add_column :members, :organization_id, :integer
    add_column :members, :gender, :boolean, :default => false 
  end
	# first_name
	# last_name
	# gender
	# city
	# organization_id
end
