defmodule CatalogoVideosBackend.Repo.Migrations.CreateGenres do
  use Ecto.Migration

  def change do
    create table(:genres, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :is_active, :boolean, default: true, null: false

      timestamps()
    end

  end
end
