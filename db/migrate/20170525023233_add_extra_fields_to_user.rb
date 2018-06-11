class AddExtraFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :text
    add_column :users, :description, :text
  end
end
