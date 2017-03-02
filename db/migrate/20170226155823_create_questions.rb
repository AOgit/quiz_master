class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.string :exam

      t.timestamps null: false
    end
  end
end
