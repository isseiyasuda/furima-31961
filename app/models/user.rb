class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

with_options presence: true do
  validates :nickname
  validates :birth_date

with_options format: { with: /\A[一-龥ぁ-ん]/,
  message: "全角（漢字・ひらがな・カタカナ）のみ使えます" } do
    validates :last_name
    validates :first_name
  end
 with_options format: { with: /\A[ァ-ヶー－]+\z/,
  message: "全角（カタカナ）のみ使えます" } do
    validates :last_name_kana
    validates :first_name_kana
  end
with_options format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/} do
    validates :password
    validates :password_confirmation
  end
  end
end 