module Deserializers
  class Operation < Transproc::Transformer[Container]
    symbolize_keys
    unwrap :params, %i[data]
    unwrap :data, %i[attributes]
    unwrap :attributes, %i[value datetime]
  end
end
