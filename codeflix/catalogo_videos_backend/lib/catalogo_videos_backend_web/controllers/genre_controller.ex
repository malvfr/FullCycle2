defmodule CatalogoVideosBackendWeb.GenreController do
  use CatalogoVideosBackendWeb, :controller

  alias CatalogoVideosBackend.Genres
  alias CatalogoVideosBackend.Genres.Genre

  action_fallback CatalogoVideosBackendWeb.FallbackController

  def index(conn, _params) do
    genres = Genres.list_genres()
    render(conn, "index.json", genres: genres)
  end

  def create(conn, genre_params) do
    with {:ok, %Genre{} = genre} <- Genres.create_genre(genre_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.genre_path(conn, :show, genre))
      |> render("show.json", genre: genre)
    end
  end

  def show(conn, %{"id" => id}) do
    genre = Genres.get_genre!(id)
    render(conn, "show.json", genre: genre)
  end

  def update(conn, genre_params = %{"id" => id}) do
    genre = Genres.get_genre!(id)

    with {:ok, %Genre{} = genre} <- Genres.update_genre(genre, genre_params) do
      render(conn, "show.json", genre: genre)
    end
  end

  def delete(conn, %{"id" => id}) do
    genre = Genres.get_genre!(id)

    with {:ok, %Genre{}} <- Genres.delete_genre(genre) do
      send_resp(conn, :no_content, "")
    end
  end
end
