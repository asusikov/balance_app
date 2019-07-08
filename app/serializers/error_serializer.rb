# frozen_string_literal: true

class ErrorSerializer < ActiveModel::Serializer
  attributes :id, :errors
end
