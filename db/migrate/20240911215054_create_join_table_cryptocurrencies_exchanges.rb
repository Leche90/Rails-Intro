class CreateJoinTableCryptocurrenciesExchanges < ActiveRecord::Migration[6.1]
  def change
    create_join_table :cryptocurrencies, :exchanges do |t|
      # t.index [:cryptocurrency_id, :exchange_id]
      # t.index [:exchange_id, :cryptocurrency_id]
    end
  end
end
