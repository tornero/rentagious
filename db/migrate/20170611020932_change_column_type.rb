class ChangeColumnType < ActiveRecord::Migration
  def up
        change_column :reservations, :price, :float
        change_column :reservations, :total, :float
    end

    def down
        change_column :reservations, :price, :float
        change_column :reservations, :total, :float
    end
end
