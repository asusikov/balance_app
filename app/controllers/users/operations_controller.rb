class Users::OperationsController < ApplicationController

  before_action :find_user

  def index
    @operations = @user.operations.all
    render json: @operations
  end

  def create
    Transactions::CreateOperation.new.call(user_id: params[:user_id], params: params) do |result|
      result.success do |operation|
        render json: operation, status: :created
      end
      result.failure :find_user do |user_id|
        render json: { error: "User #{user_id} not found" }, status: :not_found
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

  def find_user
    @user = User.find(params[:user_id])
  end
end
