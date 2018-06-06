class CreateOperation
  include Dry::Transaction

  # locking database
  # transaction

  step :load_user
  step :deserialize_params
  step :validate_params
  step :persist_operation
  step :update_balance
end
