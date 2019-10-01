class AddFunToProfessions < ActiveRecord::Migration
  def change
    add_column :professions, :fun, :integer
  end
end
