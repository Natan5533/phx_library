defmodule PhxLibraryWeb.AuthorsController do
  use PhxLibraryWeb, :controller
  alias PhxLibraryWeb.{ErrorView, AuthorsView}
  alias PhxLibrary.Entities.Authors

  def create(conn, params)do
    params
    |> Authors.create()
    |> handler_response(conn)
  end

  def show(conn, %{"id" => id}) do
    with  {:ok, author} <- Authors.show_by_id(id)  do
      conn
      |> put_status(200)
      |> put_view(AuthorsView)
      |> render("show.json", author: author)
    else
      {:error, _reason} -> send_resp(conn, 404, "Author not found")
    end

  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    with {:ok, author} <- Authors.show_by_id(id)  do
      author
      |> Authors.update(author_params)
      |> handler_response(conn)
    else
      {:error, _reason} -> send_resp(conn, 404, "Author not found")
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, author} <- Authors.show_by_id(id) do
      author
      |> Authors.delete()
      |> handler_response(conn)
    else
      {:error, _reason} -> send_resp(conn, 404, "Author not found")
    end

  end

  defp handler_response({:ok, author}, conn) do
    conn
    |> put_status(200)
    |> put_view(AuthorsView)
    |> render("success.json", author: author)
  end
  defp handler_response({:error, reason}, conn) do
    conn
    |> put_status(400)
    |> put_view(ErrorView)
    |> render("400.json", reason: reason)
  end
end
