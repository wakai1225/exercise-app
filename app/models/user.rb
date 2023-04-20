class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    def self.find_for_database_authentication(warden_conditions)
       conditions = warden_conditions.dup
       patient_id = conditions.delete(:patient_id)
       birth_date = conditions.delete(:birth_date)
       where(conditions).where(["patient_id = :patient_id AND birth_date = :birth_date",
                                { patient_id: patient_id, birth_date: birth_date }]).first
    end

    has_many :exercises
end
