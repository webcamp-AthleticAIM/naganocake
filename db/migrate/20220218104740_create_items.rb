class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.integer :price
      t.text :introduction
      t.string :image_id

      t.boolean :sales_status, default: false

      t.timestamps
    end
  end
end
