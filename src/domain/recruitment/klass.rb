# frozen_string_literal: true

module Domain
  module Recruitment
    class Klass < Dry::Struct
      attribute :name, Types::String
      attribute :icon, Types::String

      attribute :specializations, Types::Array.of(Specialization)
    end
  end
end
