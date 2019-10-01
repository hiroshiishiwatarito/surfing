class AddThirdwordToTests < ActiveRecord::Migration
  def change
    add_column :tests, :thirdword, :string
  end
end
