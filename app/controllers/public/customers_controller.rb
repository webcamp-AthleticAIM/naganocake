class Public::CustomersController < ApplicationController

   before_action :configure_account_update_params, only: [:update]

  def edit
    @customer = current_customer
  end

  def update
    super
  end

  def show
    @customer = current_customer
  end

  def unsubscribe
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  protected

  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update,  keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

end
