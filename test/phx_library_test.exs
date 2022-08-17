defmodule LibraryTest do
  alias PhxLibrary.{Repo, Library, Author, Book}
  use PhxLibrary.DataCase

  # Esse modulo tem o intuito de criar um ambiente de teste para as associações do phxlibrary

  test "create the library" do
    params = %Library{name: "natan", address: "a"}
    {response, _} = Repo.insert(params)

    assert response == :ok
  end

  test "Author belongs to Library" do
    libraryparams = Repo.insert(%Library{name: "natan", address: "a"})
    {_, library} = libraryparams

    params = %Author{name: "Autor", email: "a@a", library_id: library.id}
    {response, _} = Repo.insert(params)

    assert response == :ok
  end

  test "Book belongs to Author" do
    libraryparams = Repo.insert(%Library{name: "natan", address: "a"})
    {_, library} = libraryparams

    authorparams = Repo.insert(%Author{name: "Autor", email: "a@a", library_id: library.id})
    {_, author} = authorparams

    {response, _} = Repo.insert(%Book{title: "titulo", author_id: author.id})

    assert response == :ok
  end
end
