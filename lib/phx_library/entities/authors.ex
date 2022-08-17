defmodule PhxLibrary.Entities.Authors do
  alias PhxLibrary.{Repo, Author}

  def create(author_params) do
    author_params
    |> Author.changeset()
    |> Repo.insert()
  end

  def show_by_id(params) do
    case Repo.get(Author, params) do
      nil -> {:error, :Author_not_found}
      author -> {:ok, author}
    end
  end

  def delete(author) do
    Repo.delete(author)
  end

  def update(%Author{} = author, params) do
    author
    |> Author.changeset(params)
    |> Repo.update()
  end
end
