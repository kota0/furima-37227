class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,presence: true, uniqueness: ture, inclusion: { in: '@' }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :encrypted_password, presence: true, :content, {length: {minimum:6}}, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'},
            confirmation: true
  validates :nickname

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  
  validates :last_name_kana, format:presence: true, { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'    
  validates :first_name_kana, format:presence: true, { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'
  validates :birthday,presence: true

  has_many :items
  has_many :buys

end
