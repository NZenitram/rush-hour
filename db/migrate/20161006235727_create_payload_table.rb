class CreatePayloadTable < ActiveRecord::Migration
  def change
    create_table :payloads do |t|
      t.string     :url
      t.datetime   :requestedAt
      t.integer    :respondedIn
      t.string     :referredBy
      t.string     :requestType
      t.string     :eventName
      t.string     :userAgent
      t.integer    :resolutionWidth
      t.integer    :resolutionHeight
      t.string     :ip

      t.timestamps null: false
    end
  end
end
