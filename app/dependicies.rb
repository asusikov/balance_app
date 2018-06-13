module Dependicies
  module Container
    extend Dry::Container::Mixin
  end
  Transaction = Dry::Transaction(container: Container)
  Import = Dry::AutoInject(Container)
end
