class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer.name
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
