class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :payloads, :requestedAt, :requested_at
    rename_column :payloads, :respondedIn, :responded_in
    rename_column :payloads, :referredBy_id, :referred_by_id
    rename_column :payloads, :requestType_id, :request_type_id
    rename_column :payloads, :eventName_id, :event_name_id
    rename_column :payloads, :userAgent_id, :user_agent_id
  end
end
