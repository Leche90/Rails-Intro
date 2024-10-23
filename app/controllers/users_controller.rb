class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @transactions = @user.transactions  # Add this line to include transactions
  end
end
