# frozen_string_literal: true

module Application
  module Controllers
    module Admin
      module Recruitments
        class Update < Controller
          include Hanami::Action

          def call(_params)
            respond_with({})
          end
        end
      end
    end
  end
end
