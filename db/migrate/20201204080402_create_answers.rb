class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.text :description
      t.boolean :right

      t.timestamps
    end
  end
end
