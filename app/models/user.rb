class User < ApplicationRecord
    belongs_to :city
    has_many :gossips
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "CreatePrivateMessage"
    has_many :received_messages, foreign_key: 'recepient_id', class_name: "CreatePrivateMessage"
    has_many :comments

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
    validates :age, presence: true, numericality: { only_integer: true }
    validates :password, presence: true, length: { minimum: 6 }

end
