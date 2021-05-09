# frozen_string_literal: true

module Application
  module Controllers
    module Admin
      module Applications
        class Index < Controller
          include Hanami::Action
          include Domain::Recruitment::Importer['application_repository']

          def call(_params)
            applications = application_repository.all

            result = applications.map(&:to_h)

            respond_with(result)
          end
        end
      end
    end
  end
end
