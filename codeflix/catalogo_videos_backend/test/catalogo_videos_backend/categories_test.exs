defmodule CatalogoVideosBackend.CategoriesTest do
  use CatalogoVideosBackend.DataCase

  alias CatalogoVideosBackend.Categories

  describe "categories" do
    # bob
    alias CatalogoVideosBackend.Categories.Category

    @valid_attrs %{is_active: true, name: "some name", description: "some description"}
    @update_attrs %{
      is_active: false,
      name: "some updated name",
      description: "some updated description"
    }
    @invalid_attrs %{is_active: nil, name: nil, description: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Categories.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Categories.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Categories.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Categories.create_category(@valid_attrs)
      assert category.is_active == true
      assert category.name == "some name"
      assert category.description == "some description"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Categories.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Categories.update_category(category, @update_attrs)
      assert category.is_active == false
      assert category.name == "some updated name"
      assert category.description == "some updated description"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Categories.update_category(category, @invalid_attrs)
      assert category == Categories.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Categories.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Categories.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Categories.change_category(category)
    end
  end
end
