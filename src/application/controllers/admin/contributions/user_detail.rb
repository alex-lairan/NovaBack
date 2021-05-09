# frozen_string_literal: true

module Application
  module Controllers
    module Admin
      module Contributions
        class UserDetail < Controller
          include Hanami::Action

          def call(_params)
            respond_with({})
          end
        end
      end
    end
  end
end
