class AddNewUserFields < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, null: false, after: 'email'
    add_column :users, :is_active, :boolean, null: false, default: true
    # Ex:- :default =>''
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
