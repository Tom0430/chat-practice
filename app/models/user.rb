class User < ApplicationRecord
    before_save { self.email = email.downcase }
    #DB保存前に小文字に変換

    validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
    validates :email, presence: true,
    uniqueness: { case_sensitive: false },
    #大文字・小文字の区別なし
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    #「/i」は大文字・小文字を区別せずにマッチングさせる正規表現
    has_many :messages
    has_secure_password validations: false
    validates :password, length: (6..32), presence: true, confirmation: true, unless: :google_user?


    private
    def google_user?
        self.uid.present?
    end
end
