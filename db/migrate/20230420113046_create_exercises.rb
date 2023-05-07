class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.references  :user,      null: false, foreign_key: true
      t.text        :url1,      null: false
      t.text        :url2
      t.text        :url3
      t.text        :url4

      t.timestamps
    end
  end
end
