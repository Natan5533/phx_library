defmodule Entities.BookTest do
  alias PhxLibrary.Book
  alias PhxLibrary.Entities.Books
  use PhxLibrary.DataCase
  import Factory

  test "Create new book" do
    author = insert(:author)

    book_params = %{title: "title", author_id: author.id}

    assert {:ok, _} = Books.create(book_params)
  end

  test "Return one  book by author" do
    author = insert(:author)

    book_params = %{title: "title", author_id: author.id}
    {_, book} = Books.create(book_params)

    {:ok, book_returned} = Books.show_by_id(book.id)

    assert book_returned.title == "title"
  end

  test "Delete book by id" do
    author = insert(:author)

    book_params = %{title: "book deleted", author_id: author.id}
    {_, book} = Books.create(book_params)

    {:ok, book_returned} = Books.show_by_id(book.id)

    assert {:ok, _} = Books.delete(book_returned)
    assert {:error, :Book_not_found} == Books.show_by_id(book.id)
  end

  test "Update book" do
    author = insert(:author)

    book_params = %{title: "Error", author_id: author.id}
    {_, book} = Books.create(book_params)

    {:ok, book_returned} = Books.show_by_id(book.id)

    assert {:ok, book_struct} = Books.update(book_returned, %{title: "new title"})
    assert book_struct.title == "new title"
  end
end
