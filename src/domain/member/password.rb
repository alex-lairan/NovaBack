require 'bcrypt'

module Domain
  module Member
    class PasswordGenerator
      def call(password, salt)
        encrypted_password = BCrypt::Password.create(password + salt)

        Password.new(encrypted_password: encrypted_password, salt: salt)
      end
    end
  end
end

module Domain
  module Member
    class Password < Dry::Struct
      attribute :encrypted_password, String
      attribute :salt, String

      def password
        BCrypt::Password.new(encrypted_password)
      end

      def ==(lhs)
        password == lhs + salt
      end
    end
  end
end
