defmodule Prologue.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "category" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [])
    |> validate_required([])
  end
end
