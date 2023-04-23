class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

    validates :patient_id, presence: true
    validates :birth_date, presence: true, format: { with: /\A[0-9]{8}\z/, message: 'is invalid' }

    has_many :exercises
end
