# frozen_string_literal: true

module Infrastructure
  module Relations
    class Recruitments < ROM::Relation[:sql]
      schema(:recruitments, infer: true) do
        associations do
          belongs_to :specialization
        end
      end
    end
  end
end
