class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,presence: true, uniqueness: ture, inclusion: { in: @ }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :encrypted_password, presence: true, :content, {length: {minimum:6}}, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'},
            confirmation: true
  validates :nickname,
  validates :last_name
  validates :first_name
  validates :last_name_kana      
  validates :first_name_kana
  validates :birthday

  has_many :items
  has_many :buys

end
