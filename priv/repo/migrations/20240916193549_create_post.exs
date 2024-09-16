defmodule Prologue.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:post) do
      add :title, :string
      add :content, :text
      add :user_id, :string
      add :category_id, :string

      timestamps(type: :utc_datetime)
    end
  end
end
