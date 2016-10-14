class CreateRequestTypesTable < ActiveRecord::Migration
  def change
    create_table :request_types do |t|
      t.string :http_verb

      t.timestamps null: false
    end

  end
end
