# frozen_string_literal: true

module Application
  module Controllers
    module Applications
      class Create < Controller
        include Hanami::Action
        include Dry::Monads[:result]
        include Domain::Recruitment::Importer['use_cases.apply']
        include Importer['contracts.recruitment.application_contract']

        def call(params)
          monad =
            application_contract
              .call(params.to_h)
              .to_monad
              .fmap { |contract| apply.call(contract) }

          case monad
          in Success(application)
            respond_with(application.to_h)
          in Failure(contract)
            respond_with(contract.errors.to_h, code: 422)
          else
            raise 'Invalid statement'
          end
        end
      end
    end
  end
end
