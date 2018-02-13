class Users::OperationsController < ApplicationController

  before_action :find_user

  def index
    @operations = @user.operations.all
    render json: @operations
  end

  def create
    @operation = @user.operations.new(operation_attributes)

    if @operation.save
      render json: @operation, status: :created
    else
      render json: @operation, status: :unprocessable_entity
    end
  end

  def destroy
    @operation = @user.operations.find params[:id]
    @operation.destroy
    head :no_content
  end

  private

  def operation_attributes
    params.require(:data).permit(attributes: [:value, :datetime])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
