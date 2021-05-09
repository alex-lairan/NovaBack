# frozen_string_literal: true

module Domain
  module Recruitment
    class RecruitmentStatus < Dry::Struct
      attribute :id, Types::String
      attribute :count, Types::Integer
      attribute :note, Types::String
    end
  end
end
