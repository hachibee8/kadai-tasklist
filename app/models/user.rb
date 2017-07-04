class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name,presence: true,length:{maximum: 50}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  #Userモデルに[password_digest]カラムを用意し下記のコードを書くと、ログイン認証のための準備をしてくれる。
  has_secure_password
  
  has_many :microposts
end
