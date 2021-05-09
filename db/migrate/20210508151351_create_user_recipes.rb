# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :user_recipes do
      column :id, :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true, null: false

      foreign_key :user_job_id, :user_jobs, null: false, type: :uuid
      foreign_key :recipe_id, :recipes, null: false, type: :uuid
    end
  end
end
