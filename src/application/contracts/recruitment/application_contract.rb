# frozen_string_literal: true

module Application
  module Contracts
    module Recruitment
      class ApplicationContract < Dry::Validation::Contract
        params do
          required(:name).filled(:string)
          required(:note).filled(:string)
          required(:specialization_id).filled(:string)
        end
      end
    end
  end
end
