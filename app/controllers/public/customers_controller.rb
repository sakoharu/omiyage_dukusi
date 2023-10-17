class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @souvenir = Souvenir.all

  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  def index
  end

end
