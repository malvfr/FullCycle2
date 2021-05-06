defmodule CatalogoVideosBackend.GenresTest do
  use CatalogoVideosBackend.DataCase

  alias CatalogoVideosBackend.Genres

  describe "genres" do
    alias CatalogoVideosBackend.Genres.Genre

    @valid_attrs %{is_active: true, name: "some name"}
    @update_attrs %{is_active: false, name: "some updated name"}
    @invalid_attrs %{is_active: nil, name: nil}

    def genre_fixture(attrs \\ %{}) do
      {:ok, genre} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Genres.create_genre()

      genre
    end

    test "list_genres/0 returns all genres" do
      genre = genre_fixture()
      assert Genres.list_genres() == [genre]
    end

    test "get_genre!/1 returns the genre with given id" do
      genre = genre_fixture()
      assert Genres.get_genre!(genre.id) == genre
    end

    test "create_genre/1 with valid data creates a genre" do
      assert {:ok, %Genre{} = genre} = Genres.create_genre(@valid_attrs)
      assert genre.is_active == true
      assert genre.name == "some name"
    end

    test "create_genre/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Genres.create_genre(@invalid_attrs)
    end

    test "update_genre/2 with valid data updates the genre" do
      genre = genre_fixture()
      assert {:ok, %Genre{} = genre} = Genres.update_genre(genre, @update_attrs)
      assert genre.is_active == false
      assert genre.name == "some updated name"
    end

    test "update_genre/2 with invalid data returns error changeset" do
      genre = genre_fixture()
      assert {:error, %Ecto.Changeset{}} = Genres.update_genre(genre, @invalid_attrs)
      assert genre == Genres.get_genre!(genre.id)
    end

    test "delete_genre/1 deletes the genre" do
      genre = genre_fixture()
      assert {:ok, %Genre{}} = Genres.delete_genre(genre)
      assert_raise Ecto.NoResultsError, fn -> Genres.get_genre!(genre.id) end
    end

    test "change_genre/1 returns a genre changeset" do
      genre = genre_fixture()
      assert %Ecto.Changeset{} = Genres.change_genre(genre)
    end
  end
end
