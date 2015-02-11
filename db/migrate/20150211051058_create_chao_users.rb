class CreateChaoUsers < ActiveRecord::Migration
  def change
    create_table :chao_users do |t|
      t.string :nick_name
      t.integer :coin_count , :default => 0

      t.timestamps
    end
  end
end
