class ExchangesController < ApplicationController
  def index
    if params[:query].present?
      @exchanges = Exchange.where('name LIKE ?', "%#{params[:query]}%")
    else
      @exchanges = Exchange.all
    end
  end

  def show
    @exchange = Exchange.find(params[:id])
    @cryptocurrencies = @exchange.cryptocurrencies  # Fetch related cryptocurrencies
  end
end
