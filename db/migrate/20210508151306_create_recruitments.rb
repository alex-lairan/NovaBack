# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :recruitments do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true, null: false

      foreign_key :specialization_id, :specializations, null: false, type: :uuid

      column :count, Integer, null: false
      column :note, String, null: false
    end
  end
end
