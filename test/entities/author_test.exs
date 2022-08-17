defmodule Entities.AuthorTest do
  alias PhxLibrary.Entities.Authors
  use PhxLibrary.DataCase
  import Factory


  test "Create new author" do
    library = insert(:library)

    author_params = %{name: "Chico", email: "a@a", library_id: library.id}

    assert {:ok, _} = Authors.create(author_params)
  end

  test "Return one author by id" do
    library = insert(:library)

    author_params = %{name: "Bento", email: "a@a", library_id: library.id}
    {_, details} = Authors.create(author_params)

    {:ok, author_returned} = Authors.show_by_id(details.id)

    assert author_returned.name == "Bento"
  end

  test "Delete author by id" do
    library = insert(:library)

    author_params = %{name: "Author deleted", email: "a@a", library_id: library.id}
    {_, details} = Authors.create(author_params)

    {:ok, author_returned} = Authors.show_by_id(details.id)

    assert {:ok, _} = Authors.delete(author_returned)
    assert {:error, :Author_not_found} == Authors.show_by_id(details.id)
  end

  test "Update one library" do
    library = insert(:library)

    author_params = %{name: "Error name", email: "a@a", library_id: library.id}
    {_, details} = Authors.create(author_params)

    {:ok, author_returned} = Authors.show_by_id(details.id)

    assert {:ok, author_struct} = Authors.update(author_returned, %{name: "New name"})
    assert author_struct.name == "New name"
  end
end
