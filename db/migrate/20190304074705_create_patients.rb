class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.strinng :first_name
      t.string :last_name
      t.string :middle_name
      t.date :date_of_birth
      t.string :external_id
      t.string :sync_id, limit: 32

      t.timestamps
    end
    add_index :patients, :sync_id, unique: true
  end
end
