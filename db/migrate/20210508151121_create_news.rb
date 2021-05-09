# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :news do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true, null: false

      column :title, String, null: false
      column :body, String, null: false

      foreign_key :klass_id, :klasses, null: false, type: :uuid

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
