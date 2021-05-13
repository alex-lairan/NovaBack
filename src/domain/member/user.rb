module Domain
  module Member
    class User < Dry::Struct
      attribute :id, Types::String
      attribute :username, Types::String
      attribute :is_admin, Types::String

      alias :admin? :is_admin
    end
  end
end
