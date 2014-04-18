class AddSessionsTable < ActiveRecord::Migration
  def connection
    ActiveRecord::SessionStore::Session.establish_connection("#{Rails.env}_sessions").connection
  end

  def change
    create_table :sessions do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end

    add_index :sessions, :session_id, :unique => true
    add_index :sessions, :updated_at
  end
end