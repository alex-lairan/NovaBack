# frozen_string_literal: true

ROM::SQL.migration do
  up do
    execute <<-SQL
      CREATE TYPE apply_status AS ENUM ('pending', 'validated', 'refused');
    SQL

    create_table :applicants do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true, null: false

      foreign_key :specialization_id, :specializations, null: false, type: :uuid

      column :name, String, null: false
      column :note, String, null: false

      column :status, :apply_status, null: false, default: 'pending'
    end
  end

  down do
    drop_table :applicants

    execute <<-SQL
      DROP TYPE apply_status;
    SQL
  end
end
