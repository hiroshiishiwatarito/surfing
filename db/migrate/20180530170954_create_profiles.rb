class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string  :student_name
      t.string  :school
      t.string  :year
      t.string  :hometown
      t.text    :image
      t.text    :message
      t.timestamps null: false
    end
  end
end
