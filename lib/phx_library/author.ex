defmodule PhxLibrary.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxLibrary.Author

  schema "authors" do
    field :email, :string
    field :name, :string
    belongs_to :library, PhxLibrary.Library

    timestamps()
  end

  @doc false
  def changeset(%Author{} = author \\ %Author{}, attrs) do
    author
    |> cast(attrs, [:name, :email, :library_id])
    |> validate_required([:name, :email, :library_id])
  end
end
