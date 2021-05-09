# frozen_string_literal: true

module Infrastructure
  module Relations
    class Klasses < ROM::Relation[:sql]
      schema(:klasses, infer: true) do
        associations do
          has_many :specializations
        end
      end
    end
  end
end
