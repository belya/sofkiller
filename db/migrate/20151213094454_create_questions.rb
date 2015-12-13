class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :text
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
