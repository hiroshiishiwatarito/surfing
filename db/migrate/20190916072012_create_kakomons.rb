class CreateKakomons < ActiveRecord::Migration
  def change
    create_table :kakomons do |t|

      t.timestamps null: false
    end
  end
end
