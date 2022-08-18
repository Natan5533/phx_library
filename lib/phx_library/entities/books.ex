defmodule PhxLibrary.Entities.Books do
  alias PhxLibrary.{Repo, Book}

  def create(book_params) do
    book_params
    |> Book.changeset()
    |> Repo.insert()
  end

  def show_by_id(book_id) do
    case Repo.get(Book, book_id) do
      nil -> {:error, :Book_not_found}
      book -> {:ok, book}
    end
  end

  def delete(book) do
    Repo.delete(book)
  end

  def update(%Book{} = book, params) do
    book
    |> Book.changeset(params)
    |> Repo.update()
  end
end
