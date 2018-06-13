module Transactions
  class CreateOperation
    include Dependicies::Transaction
    include Dependicies::Import[:create_operation_schema]
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

    def deserialize_params(input)
      Success(input)
    end

    def validate_params(input)
      validation = create_operation_schema.call(input[:operation_params])
      validation.success? ? Success(input) : Failure(validation)
    end

    def persist_operation(input)
      Success(input)
    end

    def update_balance(input)
      Success(input)
    end
  end
end
