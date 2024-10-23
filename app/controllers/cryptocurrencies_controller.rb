class CryptocurrenciesController < ApplicationController
  def index
    # Start with all cryptocurrencies
    @cryptocurrencies = Cryptocurrency.all

    # Filter by search query if a query is provided
    if params[:query].present?
      # Use LIKE for SQLite (case-insensitive search for SQLite)
      @cryptocurrencies = @cryptocurrencies.where("name LIKE ? OR symbol LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    # Filter by selected cryptocurrency if a cryptocurrency_id is provided
    if params[:cryptocurrency_id].present?
      @cryptocurrencies = @cryptocurrencies.where(id: params[:cryptocurrency_id])
    end

    # Paginate the results
    @cryptocurrencies = @cryptocurrencies.page(params[:page]).per(10) # 10 items per page

    # Provide the list of all cryptocurrencies for the dropdown
    @all_cryptocurrencies = Cryptocurrency.all
  end

  def show
    @cryptocurrency = Cryptocurrency.find(params[:id])
  end
end
