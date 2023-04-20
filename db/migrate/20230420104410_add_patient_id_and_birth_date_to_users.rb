class AddPatientIdAndBirthDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :patient_id, :string, null: false, unique: true
    add_column :users, :birth_date, :date, null: false
  end
end
