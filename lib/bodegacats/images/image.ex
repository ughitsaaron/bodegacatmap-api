defmodule Bodegacats.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  alias Bodegacats.Accounts.User
  alias Bodegacats.Cats.Cat

  schema "images" do
    field :original_path, :string
    belongs_to :user, User, foreign_key: :created_by
    belongs_to :cat, Cat

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:original_path, :created_by, :cat_id])
    |> validate_required([:original_path, :created_by, :cat_id])
  end
end
