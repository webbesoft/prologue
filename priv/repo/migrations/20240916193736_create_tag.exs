defmodule Prologue.Repo.Migrations.CreateTag do
  use Ecto.Migration

  def change do
    create table(:tag) do
      add :value, :string
      add :post_id, :string

      timestamps(type: :utc_datetime)
    end
  end
end
