module Validations
  CreateOperationSchema = Dry::Validation.Schema do
    required(:value).value(type?: Float)
    required(:datetime).value(type?: DateTime)
  end
end
