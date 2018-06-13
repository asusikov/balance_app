class Users::OperationsController < ApplicationController

  before_action :find_user

  def index
    @operations = @user.operations.all
    render json: @operations
  end

  def create
    result = Transactions::CreateOperation.new.call(operation_attributes)

    if result.success?
      render json: @operation, status: :created
    else
      render json: @operation, serializer: ErrorSerializer, status: :unprocessable_entity
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
