# frozen_string_literal: true

module Deserializers
  class OperationDeserializer < Transproc::Transformer[Container]
    symbolize_keys
    unwrap :params, %i[data]
    unwrap :data, %i[attributes]
    unwrap :attributes, %i[value datetime]
    reject_keys %i[data attributes]
  end
end
