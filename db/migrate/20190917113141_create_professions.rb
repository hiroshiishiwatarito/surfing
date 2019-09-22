class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string   :university
      t.string   :faculty
      t.string   :lesson
      t.string   :teacher
      t.string   :book
      t.string   :thing
      t.string   :year
      t.string   :confirm
      t.string   :recommendation
      t.string   :thing
      t.text     :test
      t.text     :feel
      t.text     :content

      t.timestamps null: false
    end
  end
end
