defmodule PhxLibrary.Book do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxLibrary.{Author, Book}

  schema "books" do
    field :title, :string
    belongs_to :author, Author

    timestamps()
  end

  @doc false
  def changeset(%Book{} = book \\ %Book{}, attrs) do
    book
    |> cast(attrs, [:title, :author_id])
    |> validate_required([:title, :author_id])
  end
end
