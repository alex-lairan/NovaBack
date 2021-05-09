# frozen_string_literal: true

module Domain
  module Recruitment
    class Specialization < Dry::Struct
      attribute :name, Types::String
      attribute :icon, Types::String

      attribute :recruitment_status, RecruitmentStatus
    end
  end
end
