# frozen_string_literal: true

module Application
  module Controllers
    module Admin
      module Recruitments
        class Update < Controller
          include Hanami::Action
          include Domain::Recruitment::Importer['recruitment_repository']

          def call(params)
            recruitment_status = recruitment_repository.update(params[:id], count: params[:count], note: params[:note])

            respond_with(recruitment_status.to_h)
          end
        end
      end
    end
  end
end
