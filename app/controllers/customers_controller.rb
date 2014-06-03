class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(params.require(:customer).permit(:email, :password))

    redirect_to login_customers_path
  end

  def show
  end

  def login
  end

  def authorization
    @customer = Customer.where(email: params[:customer][:email], password: params[:customer][:password]).first

    if @customer
      render :show
    else
      redirect_to login_customers_path
    end
  end

end
