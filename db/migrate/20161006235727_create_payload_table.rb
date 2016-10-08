class CreatePayloadTable < ActiveRecord::Migration
  def change
    create_table :payloads do |t|
      t.integer     :url_id
      t.datetime    :requestedAt
      t.integer     :respondedIn
      t.integer     :referredBy_id
      t.integer     :requestType_id
      t.integer     :eventName_id
      t.integer     :userAgent_id
      t.integer     :resolution_id
      t.integer     :ip_id

      t.timestamps null: false
    end
  end
end
