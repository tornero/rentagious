class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star, default: 1
      t.references :item, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
