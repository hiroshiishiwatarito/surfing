class AddBookToTests < ActiveRecord::Migration
  def change
    add_column :tests, :book, :string
  end
end
