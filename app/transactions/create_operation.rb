module Transactions
  class CreateOperation
    include Dependicies::Transaction
    include Dependicies::Import[:create_operation_schema, :operation_deserializer]
    # locking database
    # transaction

    step :load_user
    step :deserialize_params
    step :validate_params
    step :persist_operation
    step :update_balance

    def load_user(input)
      Success(input)
    end

    def deserialize_params(params:, **args)
      operation_params = operation_deserializer.new.call(params)
      Success(operation_params: operation_params, **args)
    end

    def validate_params(operation_params:, **args)
      validation = create_operation_schema.call(operation_params)
      validation.success? ? Success(operation_params: operation_params, **args) : Failure(validation)
    end

    def persist_operation(input)
      Success(input)
    end

    def update_balance(input)
      Success(input)
    end
  end
end
