# For adding coordinates to exchanges

class AddCoordinatesToExchanges < ActiveRecord::Migration[6.1]
  def change
    add_column :exchanges, :latitude, :float
    add_column :exchanges, :longitude, :float
  end
end
