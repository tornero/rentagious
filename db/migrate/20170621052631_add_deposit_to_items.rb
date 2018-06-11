class AddDepositToItems < ActiveRecord::Migration
  def change
    add_column :items, :deposit, :float
  end
end
