class User < ApplicationRecord
  has_many :products
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :email, uniqueness: true

  with_options presence: true do
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width katakana characters' } do
    validates :family_name_kana
    validates :first_name_kana
  end
end
