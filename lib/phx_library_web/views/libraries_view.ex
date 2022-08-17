defmodule PhxLibraryWeb.LibrariesView do
  use PhxLibraryWeb, :view

  def render("success.json", %{library: %{name: name, address: address}}) do
    %{name: name, address: address}
  end

  def render("show.json", %{library: %{name: name, id: id, address: address}}) do
    %{id: id, name: name, address: address}
  end
end
