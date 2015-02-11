class CreateChaoExchangeCodes < ActiveRecord::Migration
  def change
    create_table :chao_exchange_codes do |t|
      t.string :code
      t.integer :coin_count
      t.references :user , index: true
      t.datetime :date
      t.timestamps
    end
  end
end
