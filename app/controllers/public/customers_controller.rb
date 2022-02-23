class Public::CustomersController < ApplicationController

  def edit
    @customer = current_customer
  end

  def update
     @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_mypage_path(current_customer)
    else
      render "edit"
    end
  end

  def show
    @customer = current_customer
  end

  def unsubscribe

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

    def customer_params
        params.require(:customer).permit(:is_deleted, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
    end

end
