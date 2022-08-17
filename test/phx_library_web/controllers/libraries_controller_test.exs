defmodule LibrariesControllerTest do
  use PhxLibraryWeb.ConnCase
  import Factory

  describe "POST Create" do
    test "Success", %{conn: conn} do
      library_params = %{name: "Kalunga", address: "avenue ronaldo"}
      expected_body = "{\"address\":\"avenue ronaldo\",\"name\":\"Kalunga\"}"

      conn = post(conn, Routes.libraries_path(conn, :create), library_params)

      assert response(conn, 200)
      assert expected_body == conn.resp_body
    end

    test "Error", %{conn: conn} do
      library_params = %{name: "Kalunga"}
      expected_body = "{\"errors\":{\"Valid\":false}}"
      conn = post(conn, Routes.libraries_path(conn, :create), library_params)

      assert response(conn, 400)
      assert expected_body == conn.resp_body
    end
  end

  describe "GET Show" do
    test "Success", %{conn: conn} do
      library = insert(:library)
      library_params = library.id

      expected_body =
        "{\"address\":\"Rua dos padeiros\",\"id\":#{library.id},\"name\":\"Kalunga\"}"

      conn = get(conn, Routes.libraries_path(conn, :show, library_params))

      assert response(conn, 200)
      assert expected_body == conn.resp_body
    end

    test "Error for library not found", %{conn: conn} do
      params = 10293
      espected_body = "Library not found"

      conn = get(conn, Routes.libraries_path(conn, :show, params))

      assert response(conn, 404)
      assert espected_body == conn.resp_body
    end
  end

  describe "PUT Update" do
    test "Success", %{conn: conn} do
      library = insert(:library)
      id = library.id
      params = %{"library" => %{"name" => "New Library"}}
      expected_body = "{\"address\":\"Rua dos padeiros\",\"name\":\"New Library\"}"

      conn = put(conn, Routes.libraries_path(conn, :update, id), params)

      assert response(conn, 200)
      assert expected_body == conn.resp_body
    end

    test "For library not found", %{conn: conn} do
      invalid_id = 13_131_313
      params = %{"library" => %{"name" => "New Library"}}
      expected_body = "Library not found"

      conn = put(conn, Routes.libraries_path(conn, :update, invalid_id), params)

      assert response(conn, 404)
      assert expected_body == conn.resp_body
    end
  end

  describe "DELETE" do
    test "Success", %{conn: conn} do
      library = insert(:library)
      expected_params = "{\"address\":\"Rua dos padeiros\",\"name\":\"Kalunga\"}"

      conn = delete(conn, Routes.libraries_path(conn, :delete, library.id))

      assert response(conn, 200)
      assert expected_params == conn.resp_body
    end
  end
end
