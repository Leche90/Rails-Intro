class TransactionsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id]) # Assuming this is nested under users
      @transactions = @user.transactions
    else
      @transactions = Transaction.all # Show all transactions if no user is specified
    end
  end
end
