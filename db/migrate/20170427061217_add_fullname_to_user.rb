class AddFullnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :text
  end
end
