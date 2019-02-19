defmodule Bodegacats.Cats.Cat do
  use Ecto.Schema

  import Ecto.Changeset

  alias Bodegacats.Accounts.User

  schema "cats" do
    field :lat, :float
    field :lng, :float
    belongs_to :user, User, foreign_key: :created_by

    timestamps()
  end

  @doc false
  def changeset(cat, attrs) do
    cat
    |> cast(attrs, [:lat, :lng])
    |> validate_required([:lat, :lng])
  end
end
