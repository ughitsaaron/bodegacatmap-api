defmodule Bodegacats.CatsTest do
  use Bodegacats.DataCase

  alias Bodegacats.Cats

  describe "cats" do
    alias Bodegacats.Cats.Cat

    import Bodegacats.CatsFixtures

    @invalid_attrs %{}

    test "list_cats/0 returns all cats" do
      cat = cat_fixture()
      assert Cats.list_cats() == [cat]
    end

    test "get_cat!/1 returns the cat with given id" do
      cat = cat_fixture()
      assert Cats.get_cat!(cat.id) == cat
    end

    test "create_cat/1 with valid data creates a cat" do
      valid_attrs = %{}

      assert {:ok, %Cat{} = cat} = Cats.create_cat(valid_attrs)
    end

    test "create_cat/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cats.create_cat(@invalid_attrs)
    end

    test "update_cat/2 with valid data updates the cat" do
      cat = cat_fixture()
      update_attrs = %{}

      assert {:ok, %Cat{} = cat} = Cats.update_cat(cat, update_attrs)
    end

    test "update_cat/2 with invalid data returns error changeset" do
      cat = cat_fixture()
      assert {:error, %Ecto.Changeset{}} = Cats.update_cat(cat, @invalid_attrs)
      assert cat == Cats.get_cat!(cat.id)
    end

    test "delete_cat/1 deletes the cat" do
      cat = cat_fixture()
      assert {:ok, %Cat{}} = Cats.delete_cat(cat)
      assert_raise Ecto.NoResultsError, fn -> Cats.get_cat!(cat.id) end
    end

    test "change_cat/1 returns a cat changeset" do
      cat = cat_fixture()
      assert %Ecto.Changeset{} = Cats.change_cat(cat)
    end
  end
end
