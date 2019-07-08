# frozen_string_literal: true

class OperationSerializer < ActiveModel::Serializer
  attributes :id, :value, :datetime
  belongs_to :user
end
