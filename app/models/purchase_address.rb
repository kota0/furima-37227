class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token,  :user_id, :postal_code, :area_id, :city, :house_number, :building_name, :telephone_number, :item_id
  


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :house_number
    validates :telephone_number, format: {with:/\A\d{10,11}\z/}
    validates :token, presence: true
    validates :item_id
    validates :user_id
   
  end

   def save
    purchase = Purchase.create(token: token, user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase_id)
   end

 
  

end