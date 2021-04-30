defmodule CatalogoVideosBackend.Repo do
  use Ecto.Repo,
    otp_app: :catalogo_videos_backend,
    adapter: Ecto.Adapters.Postgres
end
