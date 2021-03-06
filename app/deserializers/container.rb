# frozen_string_literal: true

module Deserializers
  module Container
    extend Transproc::Registry

    import Transproc::HashTransformations
    import Transproc::ClassTransformations
  end
end
