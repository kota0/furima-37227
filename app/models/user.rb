class User < ApplicationRecord
  #  Include default devise modules. Others available are:
  #  :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
   VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
   validates :encrypted_password, format:{ with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'}

   validates :last_name_kana, format:{ with: /\A[\p{katakana}\p{blank}ーー]+\z/, message: 'はカタカナで入力して下さい。'}, presence: true
   validates :first_name_kana, format:{ with: /\A[\p{katakana}\p{blank}ーー]+\z/, message: 'はカタカナで入力して下さい。'}, presence: true
   validates :birthday, presence: true


   with_options presence: true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
   validates :first_name
   validates :last_name
  end
  

   has_many :items
   has_many :buys

 end
