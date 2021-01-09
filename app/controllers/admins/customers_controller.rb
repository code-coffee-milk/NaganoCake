class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
  end
end
