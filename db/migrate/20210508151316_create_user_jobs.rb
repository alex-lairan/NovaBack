# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :user_jobs do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true, null: false

      foreign_key :user_id, :users, null: false, type: :uuid
      foreign_key :job_id, :jobs, null: false, type: :uuid
    end
  end
end
