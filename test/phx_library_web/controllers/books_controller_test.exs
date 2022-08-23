defmodule BooksControllerTest do
  use PhxLibraryWeb.ConnCase
  import Factory

  describe "POST create" do
    test "Success", %{conn: conn} do
      author = insert(:author)
      book_params = %{title: "title", author_id: author.id}
      #expected_params

      conn = post(conn, Routes.books_path(conn, :create), book_params)

      assert response(conn, 200)
      #assert expected_body
    end

    test "Error", %{conn: conn} do
      book_params = %{name: "Felipe"}

      conn = post(conn, Routes.books_path(conn, :create), book_params)

      assert response(conn, 400)
    end
  end

  describe "GET show" do
    test "Success", %{conn: conn} do
    require IEx; IEx.pry
      book = insert(:book)

      book_params = book.id
      #expected_params

      conn = get(conn, Routes.books_path(conn, :show, book_params))

      assert response(conn,200)
      #assert expected_body
    end

    test "Error for book not found", %{conn: conn} do
      wrong_params = 13289832098
      expected_body = "Book not found"

      conn = get(conn, Routes.books_path(conn, :show, wrong_params))

      assert response(conn, 404)
      assert expected_body  == conn.resp_body

    end
  end

  describe "PUT Update" do
    test "Success", %{conn: conn} do
      book = insert(:book)
      id = book.id
      params = %{"book" => %{"title" => "Updated Book"}}

      conn = put(conn, Routes.books_path(conn, :update, id), params)

      assert response(conn, 200)
      # assert expected_body
    end

    test "For author not found", %{conn: conn} do
      wrong_params = 0234933
      params = %{"book" => %{"title" => "Updated Book"}}
      expected_body = "Book not found"

      conn = put(conn, Routes.books_path(conn, :update, wrong_params), params)

      assert response(conn, 404)
      assert expected_body == conn.resp_body
    end
  end
  describe "DELETE" do
    test "Success", %{conn: conn} do
      book = insert(:book)
      # expected_params

      conn = delete(conn, Routes.books_path(conn, :delete, book.id))

      assert response(conn, 200)
      #assert expected_params

    end
    test "For book not found", %{conn: conn} do
      wrong_id = 3434343434343
      expected_body = "Book not found"

      conn = delete(conn, Routes.books_path(conn, :delete, wrong_id))

      assert response(conn, 404)
      assert expected_body == conn.resp_body
    end

  end
end
