class CreateReferredbysTable < ActiveRecord::Migration
  def change
    create_table :referred_bys do |t|
      t.string :address

      t.timestamps null: false
    end

  end
end
