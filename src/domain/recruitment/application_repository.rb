# frozen_string_literal: true

module Domain
  module Recruitment
    class ApplicationRepository < ROM::Repository[:applicants]
      include Nova::Import['container']

      def all
        fields = [
          applicants[:id],
          applicants[:name],
          applicants[:note],
          applicants[:status],
          klasses[:name].as(:klass_name),
          klasses[:icon].as(:klass_icon),
          specializations[:name].as(:specialization_name),
          specializations[:icon].as(:specialization_icon),
        ]

        applicants
          .join(:specialization)
          .join(:klasses, id: :klass_id)
          .select(*fields)
          .to_a
      end

      def add(application)
        applicants
          .command(:create)
          .call(application.to_h)
      end
    end
  end
end
