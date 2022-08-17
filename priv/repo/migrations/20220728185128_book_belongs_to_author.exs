defmodule PhxLibrary.Repo.Migrations.BookBelongsToAuthor do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :author_id, references(:authors)
    end
  end
end
