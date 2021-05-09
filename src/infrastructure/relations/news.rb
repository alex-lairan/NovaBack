# frozen_string_literal: true

module Infrastructure
  module Relations
    class News < ROM::Relation[:sql]
      schema(:news, infer: true) do
        associations do
          belongs_to :user
        end
      end
    end
  end
end
