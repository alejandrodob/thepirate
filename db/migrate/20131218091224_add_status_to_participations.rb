class AddStatusToParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :status, :string
  end
end
