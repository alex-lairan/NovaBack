# frozen_string_literal: true

module Domain
  module Recruitment
    class RecruitmentRepository < ROM::Repository[:recruitments]
      include Nova::Import['container']

      def all
        fields = [
          recruitments[:id],
          recruitments[:count],
          recruitments[:note],
          klasses[:name].as(:klass_name),
          klasses[:icon].as(:klass_icon),
          specializations[:name].as(:specialization_name),
          specializations[:icon].as(:specialization_icon),
        ]

        recruitments
          .join(:specialization)
          .join(:klasses, id: :klass_id)
          .select(*fields)
          .to_a
          .then { group_items(_1) }
          .values
          .then { |aggregates| aggregates.map { extract_klasses(_1) } }
      end

      def update(id, **params)
        recruitments
          .by_pk(id)
          .command(:update)
          .call(**params)
          .then { extract_recruitment(_1.to_h) }
      end

      private

      def group_items(raw_data)
        raw_data.each_with_object({}) do |recruitment, acc|
          specialization = {
            specialization_name: recruitment.specialization_name,
            specialization_icon: recruitment.specialization_icon,
            status: { id: recruitment.id, count: recruitment.count, note: recruitment.note  }
          }
          if acc[recruitment.klass_name]
            acc[recruitment.klass_name][:specializations] << specialization
          else
            acc[recruitment.klass_name] = { klass_name: recruitment.klass_name, klass_icon: recruitment.klass_icon, specializations: [specialization] }
          end
        end
      end

      def extract_klasses(aggregate)
        Klass.new(
          name: aggregate[:klass_name],
          icon: aggregate[:klass_icon],
          specializations: aggregate[:specializations].map { extract_specialization(_1) }
        )
      end

      def extract_specialization(aggregate)
        Specialization.new(
          name: aggregate[:specialization_name],
          icon: aggregate[:specialization_icon],
          recruitment_status: extract_recruitment(aggregate[:status])
        )
      end

      def extract_recruitment(aggregate)
        RecruitmentStatus.new(
          id: aggregate[:id],
          count: aggregate[:count],
          note: aggregate[:note]
        )
      end
    end
  end
end
