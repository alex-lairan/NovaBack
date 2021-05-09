# frozen_string_literal: true

module Domain
  module Recruitment
    module UseCases
      include Importers['application_repository']

      # Given applications
      # When we fetch them
      # Then the application are retrieved ordered by class and specialization
      class ListApplications
        def call
          application_repository.all
        end
      end
    end
  end
end
