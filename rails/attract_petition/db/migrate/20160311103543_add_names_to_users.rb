class AddNamesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, after: :email, :limit => 25
    add_column :users, :last_name, :string, after: :first_name, :limit => 25
  end
end
