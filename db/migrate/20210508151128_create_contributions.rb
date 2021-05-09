# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :contributions do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true, null: false

      foreign_key :klass_id, :klasses, null: false, type: :uuid

      column :amount, Integer, null: false
      column :date, DateTime, null: false
    end
  end
end
