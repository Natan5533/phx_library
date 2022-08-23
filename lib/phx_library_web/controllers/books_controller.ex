defmodule PhxLibraryWeb.BooksController do
  use PhxLibraryWeb, :controller
  alias PhxLibraryWeb.{ErrorView, BooksView}
  alias PhxLibrary.Entities.Books

  def create(conn, params) do
    params
    |> Books.create()
    |> handler_response(conn)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, book} <- Books.show_by_id(id) do
      conn
      |> put_status(200)
      |> put_view(BooksView)
      |> render("show.json", book: book)
    else
      {:error, _reason} -> send_resp(conn, 404, "Book not found")
    end
  end

  def update(conn, %{"id" => id, "book" => book_params}) do
    with  {:ok, book} <- Books.show_by_id(id) do
      book
      |> Books.update(book_params)
      |> handler_response(conn)
    else
      {:error, _reason} -> send_resp(conn, 404, "Book not found")
    end
  end

  def delete(conn, %{"id" => id}) do
    with  {:ok, book} <- Books.show_by_id(id) do
      book
      |> Books.delete()
      |> handler_response(conn)
    else
      {:error, _reason} -> send_resp(conn, 404, "Book not found")
    end
  end


  defp handler_response({:ok, book}, conn) do
    conn
    |> put_status(200)
    |> put_view(BooksView)
    |> render("success.json", book: book)
  end
  defp handler_response({:error, reason}, conn) do
    conn
    |> put_status(400)
    |> put_view(ErrorView)
    |> render("400.json", reason: reason)
  end
end
