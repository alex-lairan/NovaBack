# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :recipes do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true, null: false

      foreign_key :job_id, :jobs, null: false, type: :uuid

      column :name, String, null: false
      column :wow_id, String, null: false
    end
  end
end
