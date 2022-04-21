class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :product_name,         null: false 
      t.integer    :category_id,          null: false 
      t.integer    :situation_id,         null: false 
      t.integer    :pay_for_id,           null: false 
      t.integer    :area_id,              null: false 
      t.integer    :shipping_date_id,     null: false 
      t.references :user,                 null: false, foreign_key: true 


    end
  end
end
