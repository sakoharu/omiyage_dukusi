class Admin::CustomersController < ApplicationController
  
  def index
   @customers = Customer.all
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
  end
  
  
  
    
end
