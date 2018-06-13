module Transactions
  class CreateOperation
    include Dependicies::Transaction
    include Dependicies::Import[:create_operation_schema, :operation_deserializer]
    # locking database
    # transaction

    step :find_user
    step :deserialize_params
    step :validate_params
    step :persist_operation
    step :update_balance

    def find_user(user_id:, **args)
      user = User.find(user_id)
      Success(user: user, **args)
    rescue ActiveRecord::RecordNotFound
      Failure(user_id)
    end

    def deserialize_params(params:, **args)
      operation_params = operation_deserializer.new.call(params.to_unsafe_h)
      Success(operation_params: operation_params, **args)
    end

    def validate_params(operation_params:, **args)
      validation = create_operation_schema.call(operation_params)
      validation.success? ? Success(operation_params: operation_params, **args) : Failure(validation)
    end

    def persist_operation(user:, operation_params:, **args)
      user.operations.create!(operation_params)
      Success(user: user, operation_params: operation_params, **args)
    end

    def update_balance(user:, operation_params:, **args)
      balance = user.balance
      user.update!(balance: balance + operation_params[:value])
      Success(user: user, operation_params: operation_params, **args)
    end
  end
end
