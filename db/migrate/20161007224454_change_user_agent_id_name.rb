class ChangeUserAgentIdName < ActiveRecord::Migration
  def change
    rename_column :payloads, :user_agent_id, :u_agent_id
  end
end
