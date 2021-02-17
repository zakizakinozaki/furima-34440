class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
          
         validates :nickname, presence: true
         validates :email, uniqueness: true
         validates_format_of :password, presence: true, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
         validates :birthday, presence: true

         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
          validates :family_name
          validates :first_name
         end

         with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width katakana characters' } do
          validates :family_name_kana
          validates :first_name_kana
         end

end
