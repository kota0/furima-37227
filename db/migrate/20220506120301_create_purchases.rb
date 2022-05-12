class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|

      t.timestamps
     
      t.references     :item,    null: false
      t.references     :user,    null: false

    end
  end
end
