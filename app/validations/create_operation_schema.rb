module Validations
  class CreateOperationSchema < Dry::Validation::Contract    
    params do
      required(:value).filled(:number?)
      # TODO: Fix working with schema in transaction
      # required(:datetime).filled(:date_time?)
    end
  end
end
