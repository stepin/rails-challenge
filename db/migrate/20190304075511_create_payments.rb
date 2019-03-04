class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :amount, null: false
      t.references :patient, null: false
      t.string :external_id, null: false
      t.string :sync_id, limit: 32

      t.timestamps null: false
    end
    add_index :payments, :external_id, unique: true
  end
end
