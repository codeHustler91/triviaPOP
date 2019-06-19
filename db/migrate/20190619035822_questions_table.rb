class QuestionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :category
      t.string :difficulty
      t.string :mult_or_boo
      t.string :question
      t.string :correct_answer
      t.string :incorrect_answers
    end
  end
end
