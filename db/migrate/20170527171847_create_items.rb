class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :category
      t.text :subcategory
      t.text :listing_name
      t.text :summary
      t.text :address_street
      t.text :address_city
      t.text :address_state
      t.text :address_zip
      t.integer :price
      t.boolean :active
      t.references :user, index: true

      t.timestamps
    end
  end
end
