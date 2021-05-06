defmodule CatalogoVideosBackend.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "categories" do
    field :is_active, :boolean, default: false
    field :name, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :description, :is_active])
    |> validate_required([:name, :description, :is_active])
  end
end