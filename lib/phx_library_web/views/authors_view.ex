defmodule PhxLibraryWeb.AuthorsView do
  use PhxLibraryWeb, :view

  def render("success.json", %{author: %{name: name, email: email, library_id: library_id}}) do
    %{name: name, email: email,  library_id: library_id}
  end

  def render("show.json", %{author: %{name: name, email: email, library_id: library_id, id: id}}) do
  %{id: id, name: name, email: email,  library_id: library_id}
  end
end
