module Transactions
  module Operations
    class Create
      include Dependicies::Transaction
      include Dependicies::Import[:create_operation_schema]
      # locking database
      # transaction

      step :validate
      step :find_user
      step :persist
      step :update_balance

      private

      def validate(operation_params:, **args)
        validation = create_operation_schema.call(operation_params)
        validation.success? ? Success(operation_params: operation_params, **args) : Failure(validation)
      end

      def find_user(user_id:, **args)
        user = User.find(user_id)
        Success(user: user, **args)
      rescue ActiveRecord::RecordNotFound
        Failure(user_id)
      end

      def persist(user:, operation_params:, **args)
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
end
