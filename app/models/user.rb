class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX}

  validates :name, presence: true
  validates :first_name_kanji, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kanji, presence: true,format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :date_of_birth, presence: true

  has_many :items
  has_many :records

end
