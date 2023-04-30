class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.references  :user,      null: false, foreign_key: true
      t.string      :exercise,  null: false

      t.timestamps
    end
  end
end
