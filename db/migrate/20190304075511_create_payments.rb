class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :amount
      t.reference :patient
      t.string :external_id
      t.string :sync_id, limit: 32

      t.timestamps
    end
    add_index :payments, :sync_id, unique: true
  end
end
