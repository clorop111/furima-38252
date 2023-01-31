class ItemForm
  include ActiveModel::Model

  attr_accessor :text, :image

  with_options presence: true do
    validates :text
    validates :images
    validates :title
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_required_id
    validates :price

  end

  def save
    Item.create(text: text, images: images,title: title, explanation: explanation, category_id: category_id, condition_id: condition_id, shipping_charge_id: shipping_charge_id, prefecture_id: prefecture_id, days_required_id: days_required_id, price: price)
  end

end