class OperationSerializer < ActiveModel::Serializer
  attributes :id, :value, :datetime
  belongs_to :user
end
