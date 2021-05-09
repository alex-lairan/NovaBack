# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true, null: false

      column :username, String, unique: true, null: false
      column :encrypted_password, String, null: true
      column :salt, String, null: false

      column :sign_up_token, String, null: false
      column :member_from, DateTime, null: false

      column :is_admin, :bool, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
