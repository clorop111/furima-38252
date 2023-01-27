class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_required

  has_many_attached :images


  belongs_to :user
  has_one :record

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }
  validates :title, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "入力してください" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "入力してください" }
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1, message: "入力してください" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "入力してください" }
  validates :days_required_id, presence: true, numericality: { other_than: 1, message: "入力してください" }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }
  validates :price, presence: true, numericality:{only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end
