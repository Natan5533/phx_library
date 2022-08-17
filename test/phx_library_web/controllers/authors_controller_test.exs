defmodule AuthorsControllerTest do
  use PhxLibraryWeb.ConnCase
  import Factory

  describe "POST Create" do
    test "Success", %{conn: conn} do
      library = insert(:library)
      author_params = %{name: "Orochi", email: "rj@gmail.com", library_id: library.id}
      # eXpected_body

      conn = post(conn, Routes.authors_path(conn, :create), author_params)

      assert response(conn, 200)
      #assert expected_body
    end

    test "Error", %{conn: conn} do
      author_params = %{name: "orochinho"}
      # expected_body

      conn = post(conn, Routes.authors_path(conn, :create), author_params)

      assert response(conn, 400)
      # assert expected_body
    end
  end

  describe "GET Show" do
    test "Success", %{conn: conn} do
      author = insert(:author)
      author_params = author.id
      # expected_params

      conn = get(conn, Routes.authors_path(conn, :show, author_params))

      assert response(conn, 200)
      # assert expected_body
    end

    test "Error for author not found", %{conn: conn} do
      params = 10293
      espected_body = "Author not found"

      conn = get(conn, Routes.authors_path(conn, :show, params))

      assert response(conn, 404)
      assert espected_body == conn.resp_body

    end
  end
  describe "PUT Update" do
    test "Success", %{conn: conn} do
      author = insert(:author)
      id = author.id
      params = %{"author" => %{"email" => "email@updated"}}
      # expected_body

      conn = put(conn, Routes.authors_path(conn, :update, id), params)

      assert response(conn, 200)
      # assert expected_body
    end

      test "For author not found", %{conn: conn} do
        invalid_id = 1317131713
        params = %{"author" => %{"name" => "Michel"}}
        expected_body = "Author not found"

        conn = put(conn, Routes.authors_path(conn, :update, invalid_id), params)

        assert response(conn, 404)
        assert expected_body == conn.resp_body

      end
    end
    describe "DELETE" do
      test "Success", %{conn: conn} do
        author = insert(:author)
        # expected_params =

        conn = delete(conn, Routes.authors_path(conn, :delete, author.id))

        assert response(conn, 200)
        #assert expected_params

      end
      test "For author not found", %{conn: conn} do
        wrong_id = 3434343434343
        expected_body = "Author not found"

        conn = delete(conn, Routes.authors_path(conn, :delete, wrong_id))

        assert response(conn, 404)
        assert expected_body == conn.resp_body
      end
    end
end
