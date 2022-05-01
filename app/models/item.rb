class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :pay_for
  belongs_to :shipping_data
  belongs_to :area
  has_one_attached :image

  validates :image, presence: true
  validates :product_name, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :pay_for_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_data_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            numericality: { with: /\A[0-9]+\z/, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'is invalid' }
  validates :description_of_item, presence: true
end
