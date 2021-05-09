# frozen_string_literal: true

module Application
  module Controllers
    module Recruitments
      class Index < Controller
        include Hanami::Action
        include Domain::Recruitment::Importer['recruitment_repository']

        def call(_params)
          recruitments = recruitment_repository.all

          result = recruitments.map(&:to_h)

          respond_with(result)
        end
      end
    end
  end
end
