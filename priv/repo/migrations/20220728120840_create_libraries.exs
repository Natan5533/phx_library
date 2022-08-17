defmodule PhxLibrary.Repo.Migrations.CreateLibraries do
  use Ecto.Migration

  def change do
    create table(:libraries) do
      add :name, :string
      add :address, :string

      timestamps()
    end
  end
end
