class Users::OperationsController < ApplicationController

  before_action :find_user

  def index
    @operations = @user.operations.all
    render json: @operations
  end

  def create
    Transactions::CreateOperation.new.call(operation_params: operation_attributes) do |result|
      result.success do |operation|
        render json: operation, status: :created
      end
      result.failure :validate_params do |validation|
        render json: validation.errors, status: :unprocessable_entity
      end
      result.failure do
        render json: { error: 'Internal Server Error' }, status: :internal_server_error
      end
    end
  end

  def destroy
    @operation = @user.operations.find params[:id]
    @operation.destroy
    head :no_content
  end

  private

  def operation_attributes
    params.require(:data).permit(attributes: [:value, :datetime]).to_h[:attributes]
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
