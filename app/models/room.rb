class Room < ApplicationRecord
    has_many :messages
    has_and_belongs_to_many :users
    has_secure_password validations: false
    validate(on: :update) do |record|
        record.errors.add(:password, :blank) unless record.password_digest.present?
    end
    validates_length_of :password, maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED, on: :update
    validates_confirmation_of :password, allow_blank: true, on: :update
    validates :name, presence: true, length: { maximum: 30 }
    validates :description, presence: true, length: { maximum: 60 }
end
