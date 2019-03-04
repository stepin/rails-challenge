class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.date :date_of_birth
      t.string :external_id, null: false
      t.string :sync_id, limit: 32

      t.timestamps null: false
    end
    add_index :patients, :external_id, unique: true
  end
end
