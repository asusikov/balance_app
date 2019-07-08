# frozen_string_literal: true

module Validations
  class CreateOperationSchema < Dry::Validation::Contract
    json do
      required(:value).filled(:number?)
      # TODO: Fix working with schema in transaction
      # required(:datetime).filled(:date_time?)
    end
  end
end
