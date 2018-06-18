module Validations
  CreateOperationSchema = Dry::Validation.JSON do
    required(:value).filled(:number?)
    # TODO: Fix working with schema in transaction
    # required(:datetime).filled(:date_time?)
  end
end
