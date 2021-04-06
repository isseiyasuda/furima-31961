class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname , presence: true
         validates :last_name , presence: true, format: { with: /\A[一-龥ぁ-ん]/,
          message: "全角（漢字・ひらがな・カタカナ）のみ使えます" }
         validates :first_name , presence: true,format: { with: /\A[一-龥ぁ-ん]/,
          message: "全角（漢字・ひらがな・カタカナ）のみ使えます" }
         validates :last_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/,
          message: "全角（カタカナ）のみ使えます" }
         validates :first_name_kana, presence: true,format: { with: /\A[ァ-ヶー－]+\z/,
          message: "全角（カタカナ）のみ使えます" }
          validates :birth_date , presence: true
end
