class CreateConversions < ActiveRecord::Migration
  def up
    create_table :conversions do |t|
      t.string :from_currency
      t.string :to_currency
      t.string :created_at
    end
  end

  def down
    drop_table :conversions
  end
end