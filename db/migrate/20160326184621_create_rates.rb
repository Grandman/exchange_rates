class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.float :dollar_rate
      t.boolean :forced, default: false
      t.datetime :date_to, default: nil

      t.timestamps null: false
    end
  end
end
