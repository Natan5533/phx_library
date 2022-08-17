defmodule PhxLibraryWeb.LibrariesController do
  use PhxLibraryWeb, :controller
  alias PhxLibraryWeb.ErrorView
  alias PhxLibrary.Entities.Libraries

  def create(conn, params) do
    params
    |> Libraries.create()
    |> handler_response(conn)
  end

  def show(conn, %{"id" => id} = _params) do
    with {:ok, library} <- Libraries.show_by_id(id) do
      conn
      |> put_status(200)
      |> render("show.json", library: library)
    else
      {:error, _reason} -> send_resp(conn, 404, "Library not found")
    end
  end

  def update(conn, %{"id" => id, "library" => library_params} = _params) do
    with {:ok, library} <- Libraries.show_by_id(id) do
      library
      |> Libraries.update(library_params)
      |> handler_response(conn)
    else
      {:error, _reason} -> send_resp(conn, 404, "Library not found")
    end
  end

  def delete(conn, %{"id" => id} = _params) do
    with {:ok, library} <- Libraries.show_by_id(id) do
      library
      |> Libraries.delete()
      |> handler_response(conn)
    else
      {:error, _reason} -> send_resp(conn, 404, "Library not found")
    end
  end

  defp handler_response({:ok, library}, conn) do
    conn
    |> put_status(200)
    |> render("success.json", library: library)
  end

  defp handler_response({:error, reason}, conn) do
    conn
    |> put_status(400)
    |> put_view(ErrorView)
    |> render("400.json", reason: reason)
  end
end
