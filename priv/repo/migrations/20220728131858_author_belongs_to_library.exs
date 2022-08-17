defmodule PhxLibrary.Repo.Migrations.AuthorBelongsToLibrary do
  use Ecto.Migration

  def change do
    alter table(:authors) do
      add :library_id, references(:libraries)
    end
  end
end
