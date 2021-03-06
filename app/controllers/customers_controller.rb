class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new customer_params
    if @customer.save
      redirect_to @customer
    else
      flash[:error] = 'Você precisa preencher todos os campos!'
      render :new
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :billing_address, :mail, :phone,
                                     :cnpj)
  end
end
