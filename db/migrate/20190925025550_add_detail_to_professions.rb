class AddDetailToProfessions < ActiveRecord::Migration
  def change
    add_column :professions, :detail, :string
  end
end
