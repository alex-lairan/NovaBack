# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :klasses do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true, null: false

      column :name, String, null: false
      column :icon, String, null: false
    end
  end
end
