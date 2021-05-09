# frozen_string_literal: true

module Domain
  module Recruitment
    class Application < Dry::Struct
      attribute :id, Types::String
      attribute :name, Types::String
      attribute :note, Types::String
      attribute :status, Types::String
      attribute :specialization_id, Types::String
    end
  end
end
