# frozen_string_literal: true

module Infrastructure
  module Relations
    class Applicants < ROM::Relation[:sql]
      schema(:applicants, infer: true) do
        associations do
          belongs_to :specialization
        end
      end
    end
  end
end
