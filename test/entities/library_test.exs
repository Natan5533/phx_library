defmodule Entities.LibraryTest do
  alias PhxLibrary.Repo
  alias PhxLibrary.Entities.Libraries
  use PhxLibrary.DataCase

  test "Create new library" do
    library_params = %{name: "Elias", address: "Avenue"}

    assert {:ok, _} = Libraries.create(library_params)
  end

  test "Return one library by id" do
    library_params = %{name: "Orochi", address: "RJ"}
    {_, details} = Libraries.create(library_params)

    {:ok, library_returned} = Libraries.show_by_id(details.id)

    assert library_returned.name == "Orochi"
  end

  test "Delete library by id" do
    library_params = %{name: "library Deleted", address: "SP"}
    {_, details} = Libraries.create(library_params)

    {:ok, library_returned} = Libraries.show_by_id(details.id)

    assert {:ok, _} = Libraries.delete(library_returned)
    assert {:error, :library_not_found} == Libraries.show_by_id(details.id)
  end

  test "update one library" do
    library_params = %{name: "Error name", address: "SP"}
    {_, details} = Libraries.create(library_params)

    {:ok, library_returned} = Libraries.show_by_id(details.id)

    assert {:ok, library_struct} = Libraries.update(library_returned, %{name: "New Name"})
    assert library_struct.name == "New Name"
  end
end
