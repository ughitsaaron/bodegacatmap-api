defmodule Bodegacats.Cats.Cat do
  use Ecto.Schema

  import Ecto.Changeset

  alias Bodegacats.Accounts.User
  alias Bodegacats.Images.Image

  schema "cats" do
    field :lat, :float
    field :lng, :float
    belongs_to :user, User, foreign_key: :created_by
    has_many :images, Image, foreign_key: :cat_id

    timestamps()
  end

  @doc false
  def changeset(cat, attrs) do
    cat
    |> cast(attrs, [:lat, :lng, :created_by])
    |> validate_required([:lat, :lng, :created_by])
  end
end
