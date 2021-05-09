# frozen_string_literal: true

module Infrastructure
  module Relations
    class Contributions < ROM::Relation[:sql]
      schema(:contributions, infer: true) do
        associations do
          belongs_to :user
        end
      end
    end
  end
end
