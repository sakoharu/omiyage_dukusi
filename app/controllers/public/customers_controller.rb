class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @souvenirs = @customer.souvenirs

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def destroy
  end

  def index
  end
  
  def favorites
  end
  

  private
  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end
