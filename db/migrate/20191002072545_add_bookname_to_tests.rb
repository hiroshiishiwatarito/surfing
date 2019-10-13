class AddBooknameToTests < ActiveRecord::Migration
  def change
    add_column :tests, :bookname, :string
  end
end
