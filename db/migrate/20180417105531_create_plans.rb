class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string   :name
      t.text     :title
      t.text     :image
      t.timestamps null: false
    end
  end
end
