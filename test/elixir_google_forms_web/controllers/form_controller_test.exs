defmodule ElixirGoogleFormsWeb.FormControllerTest do
  use ElixirGoogleFormsWeb.ConnCase

  import ElixirGoogleForms.FormsFixtures

  @create_attrs %{active_until: ~U[2021-11-08 05:35:00Z], name: "some name"}
  @update_attrs %{active_until: ~U[2021-11-09 05:35:00Z], name: "some updated name"}
  @invalid_attrs %{active_until: nil, name: nil}

  describe "index" do
    test "lists all forms", %{conn: conn} do
      conn = get(conn, Routes.form_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Forms"
    end
  end

  describe "new form" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.form_path(conn, :new))
      assert html_response(conn, 200) =~ "New Form"
    end
  end

  describe "create form" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.form_path(conn, :create), form: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.form_path(conn, :show, id)

      conn = get(conn, Routes.form_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Form"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.form_path(conn, :create), form: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Form"
    end
  end

  describe "edit form" do
    setup [:create_form]

    test "renders form for editing chosen form", %{conn: conn, form: form} do
      conn = get(conn, Routes.form_path(conn, :edit, form))
      assert html_response(conn, 200) =~ "Edit Form"
    end
  end

  describe "update form" do
    setup [:create_form]

    test "redirects when data is valid", %{conn: conn, form: form} do
      conn = put(conn, Routes.form_path(conn, :update, form), form: @update_attrs)
      assert redirected_to(conn) == Routes.form_path(conn, :show, form)

      conn = get(conn, Routes.form_path(conn, :show, form))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, form: form} do
      conn = put(conn, Routes.form_path(conn, :update, form), form: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Form"
    end
  end

  describe "delete form" do
    setup [:create_form]

    test "deletes chosen form", %{conn: conn, form: form} do
      conn = delete(conn, Routes.form_path(conn, :delete, form))
      assert redirected_to(conn) == Routes.form_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.form_path(conn, :show, form))
      end
    end
  end

  defp create_form(_) do
    form = form_fixture()
    %{form: form}
  end
end
