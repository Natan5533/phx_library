defmodule PhxLibrary.Entities.Books do
  alias PhxLibrary.{Repo, Book}

  def create(book_params) do
    book_params
    |> Repo.insert()
  end

  def show_by_id(book_id) do
    Repo.get(Book, book_id)
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
