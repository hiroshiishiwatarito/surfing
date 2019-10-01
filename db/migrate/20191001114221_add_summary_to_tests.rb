class AddSummaryToTests < ActiveRecord::Migration
  def change
    add_column :tests, :summary, :string
  end
end
