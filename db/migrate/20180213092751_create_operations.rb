class CreateOperations < ActiveRecord::Migration[5.0]
  def change
    create_table :operations do |t|
      t.decimal :value
      t.datetime :datetime
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
