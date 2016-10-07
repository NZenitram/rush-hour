class CreateUAgentsTable < ActiveRecord::Migration
  def change
    create_table :u_agents do |t|
      t.string :browser
      t.string :operating_system

      t.timestamps null: false
    end
  end
end
