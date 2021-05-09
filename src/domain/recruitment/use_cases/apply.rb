# frozen_string_literal: true

module Domain
  module Recruitment
    module UseCases

      class Apply
        def call(application_contract)
          application = setup_application_from_contract(application_contract)

          application_repository.add(application)

          # TODO: Notify on discord

          application
        end

        private

        def setup_application_from_contract(application_contract)
          Application.new(
            id: SecureRandom.uuid,
            name: application_contract[:name],
            note: application_contract[:note],
            status: 'pending',
            specialization_id: application_contract[:specialization_id]
          )
        end
      end
    end
  end
end
