# frozen_string_literal: true

module Infrastructure
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users, infer: true) do
        associations do
          has_many :contributions
          has_many :news
        end
      end
    end
  end
end
