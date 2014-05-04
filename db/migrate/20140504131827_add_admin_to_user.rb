class AddAdminToUser < ActiveRecord::Migration
  change_table :users do |t|
    t.boolean :admin, default: false
  end
end
