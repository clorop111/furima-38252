class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kanji, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :date_of_birth, presence: true

  has_many :items
  has_many :records

end
