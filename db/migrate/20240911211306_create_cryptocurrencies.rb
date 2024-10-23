class CreateCryptocurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :cryptocurrencies do |t|
      t.string :name
      t.string :symbol
      t.decimal :price
      t.bigint :market_cap
      t.bigint :volume
      t.float :change

      t.timestamps
    end
  end
end
