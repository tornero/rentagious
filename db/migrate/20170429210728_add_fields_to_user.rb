class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :text
    add_column :users, :uid, :text
    add_column :users, :image, :text
    add_column :users, :text, :text
  end
end
