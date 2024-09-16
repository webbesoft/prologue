defmodule Prologue.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "post" do
    field :title, :string
    field :content, :string
    belongs_to :user, Prologue.Account.User
    has_many :tag, Prologue.Tag
    has_one :category, Prologue.Category

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [])
    |> validate_required([])
  end
end
