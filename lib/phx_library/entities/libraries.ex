defmodule PhxLibrary.Entities.Libraries do
  alias PhxLibrary.Repo
  alias PhxLibrary.Library

  def create(library_params) do
    library_params
    |> Library.changeset()
    |> Repo.insert()
  end

  def show_by_id(params) do
    case Repo.get(Library, params) do
      nil -> {:error, :library_not_found}
      library -> {:ok, library}
    end
  end

  def delete(library) do
    Repo.delete(library)
  end

  def update(%Library{} = library, params) do
    library
    |> Library.changeset(params)
    |> Repo.update()
  end
end
