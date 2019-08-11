class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string    :image
      t.string    :school
      t.string    :year
      t.string    :hometown
      t.text      :message
      t.timestamps null: false
    end
  end
end
