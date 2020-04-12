class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :material
      t.integer :study_time
      t.string :memo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
