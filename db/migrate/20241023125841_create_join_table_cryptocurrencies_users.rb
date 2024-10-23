class CreateJoinTableCryptocurrenciesUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :cryptocurrencies, :users do |t|
      # Add indexes for faster querying
      t.index :cryptocurrency_id
      t.index :user_id
    end
  end
end
