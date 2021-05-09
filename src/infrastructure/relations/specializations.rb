# frozen_string_literal: true

module Infrastructure
  module Relations
    class Specializations < ROM::Relation[:sql]
      schema(:specializations, infer: true) do
        associations do
          belongs_to :klass
        end
      end
    end
  end
end
