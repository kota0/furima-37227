class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :product_name,         null: false 
      t.integer    :category_id,          null: false 
      t.integer    :situation_id,         null: false 
      t.integer    :pay_for_id,           null: false 
      t.integer    :area_id,              null: false 
      t.integer    :shipping_data_id,     null: false 
      t.integer    :price,                null: false
      t.text       :description_of_item,  null: false
      t.references :user,                 null: false
    end
  end
end
