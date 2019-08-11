class AddMeetingplaceToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :meetingplace, :string
  end
end
