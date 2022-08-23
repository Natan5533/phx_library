defmodule PhxLibraryWeb.BooksView do
  use PhxLibraryWeb, :view

  def render("success.json", %{book: %{title: title, author_id: author_id}}) do
    %{title: title, author_id: author_id}
  end

  def render("show.json", %{book: %{id: id, title: title, author_id: author_id}}) do
    %{id: id, title: title, author_id: author_id}
  end

end
