class DropTableInformation < ActiveRecord::Migration
  def change
  	drop_table :information
  end
end
