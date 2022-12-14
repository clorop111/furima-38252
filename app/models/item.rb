class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_required

  has_one_attached :image


  belongs_to :user
  has_one :record

  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_required_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, presence: true, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
