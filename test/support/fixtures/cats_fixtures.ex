defmodule Bodegacats.CatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bodegacats.Cats` context.
  """

  @doc """
  Generate a cat.
  """
  def cat_fixture(attrs \\ %{}) do
    {:ok, cat} =
      attrs
      |> Enum.into(%{

      })
      |> Bodegacats.Cats.create_cat()

    cat
  end
end
