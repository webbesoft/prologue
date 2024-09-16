defmodule Prologue.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tag" do
    field :value, :string
    belongs_to :post, Post

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
