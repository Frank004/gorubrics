class Role < ActiveRecord::Base
    has_many :member_roles, :dependent => :destroy
	has_many :members, :through => :member_roles
end
