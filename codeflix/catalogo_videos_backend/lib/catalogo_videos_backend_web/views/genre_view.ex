defmodule CatalogoVideosBackendWeb.GenreView do
  use CatalogoVideosBackendWeb, :view
  alias CatalogoVideosBackendWeb.GenreView

  def render("index.json", %{genres: genres}) do
    %{data: render_many(genres, GenreView, "genre.json")}
  end

  def render("show.json", %{genre: genre}) do
    %{data: render_one(genre, GenreView, "genre.json")}
  end

  def render("genre.json", %{genre: genre}) do
    %{id: genre.id,
      name: genre.name,
      is_active: genre.is_active}
  end
end
