class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :bollean, default: false
  end
end
