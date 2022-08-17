defmodule PhxLibrary.Library do
  use Ecto.Schema
  import Ecto.Changeset
  alias PhxLibrary.Library

  schema "libraries" do
    field :address, :string
    field :name, :string
    has_many :authors, PhxLibrary.Author

    timestamps()
  end

  @doc false
  def changeset(%Library{} = library \\ %Library{}, attrs) do
    library
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
