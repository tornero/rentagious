class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :item, index: true

      t.timestamps
    end
  end
end
