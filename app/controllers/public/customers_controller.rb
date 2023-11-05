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
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:souvenir_id)
    @favorite_souvenir = Souvenir.where(id: favorites)
  end

  def withdraw
    customer = Customer.find(params[:customer_id])
    customer.update(is_deleted: true)
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end
