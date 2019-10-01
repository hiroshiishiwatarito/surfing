class AddTypeToProfessions < ActiveRecord::Migration
  def change
    add_column :professions, :type, :string
  end
end
