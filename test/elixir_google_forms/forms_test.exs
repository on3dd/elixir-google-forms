defmodule ElixirGoogleForms.FormsTest do
  use ElixirGoogleForms.DataCase

  alias ElixirGoogleForms.Forms

  describe "forms" do
    alias ElixirGoogleForms.Forms.Form

    import ElixirGoogleForms.FormsFixtures

    @invalid_attrs %{created_at: nil, name: nil}

    test "list_forms/0 returns all forms" do
      form = form_fixture()
      assert Forms.list_forms() == [form]
    end

    test "get_form!/1 returns the form with given id" do
      form = form_fixture()
      assert Forms.get_form!(form.id) == form
    end

    test "create_form/1 with valid data creates a form" do
      valid_attrs = %{created_at: ~T[14:00:00], name: "some name"}

      assert {:ok, %Form{} = form} = Forms.create_form(valid_attrs)
      assert form.created_at == ~T[14:00:00]
      assert form.name == "some name"
    end

    test "create_form/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_form(@invalid_attrs)
    end

    test "update_form/2 with valid data updates the form" do
      form = form_fixture()
      update_attrs = %{created_at: ~T[15:01:01], name: "some updated name"}

      assert {:ok, %Form{} = form} = Forms.update_form(form, update_attrs)
      assert form.created_at == ~T[15:01:01]
      assert form.name == "some updated name"
    end

    test "update_form/2 with invalid data returns error changeset" do
      form = form_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_form(form, @invalid_attrs)
      assert form == Forms.get_form!(form.id)
    end

    test "delete_form/1 deletes the form" do
      form = form_fixture()
      assert {:ok, %Form{}} = Forms.delete_form(form)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_form!(form.id) end
    end

    test "change_form/1 returns a form changeset" do
      form = form_fixture()
      assert %Ecto.Changeset{} = Forms.change_form(form)
    end
  end

  describe "forms" do
    alias ElixirGoogleForms.Forms.Form

    import ElixirGoogleForms.FormsFixtures

    @invalid_attrs %{created_at: nil, name: nil}

    test "list_forms/0 returns all forms" do
      form = form_fixture()
      assert Forms.list_forms() == [form]
    end

    test "get_form!/1 returns the form with given id" do
      form = form_fixture()
      assert Forms.get_form!(form.id) == form
    end

    test "create_form/1 with valid data creates a form" do
      valid_attrs = %{created_at: ~U[2021-11-08 05:28:00Z], name: "some name"}

      assert {:ok, %Form{} = form} = Forms.create_form(valid_attrs)
      assert form.created_at == ~U[2021-11-08 05:28:00Z]
      assert form.name == "some name"
    end

    test "create_form/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_form(@invalid_attrs)
    end

    test "update_form/2 with valid data updates the form" do
      form = form_fixture()
      update_attrs = %{created_at: ~U[2021-11-09 05:28:00Z], name: "some updated name"}

      assert {:ok, %Form{} = form} = Forms.update_form(form, update_attrs)
      assert form.created_at == ~U[2021-11-09 05:28:00Z]
      assert form.name == "some updated name"
    end

    test "update_form/2 with invalid data returns error changeset" do
      form = form_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_form(form, @invalid_attrs)
      assert form == Forms.get_form!(form.id)
    end

    test "delete_form/1 deletes the form" do
      form = form_fixture()
      assert {:ok, %Form{}} = Forms.delete_form(form)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_form!(form.id) end
    end

    test "change_form/1 returns a form changeset" do
      form = form_fixture()
      assert %Ecto.Changeset{} = Forms.change_form(form)
    end
  end

  describe "forms" do
    alias ElixirGoogleForms.Forms.Form

    import ElixirGoogleForms.FormsFixtures

    @invalid_attrs %{name: nil}

    test "list_forms/0 returns all forms" do
      form = form_fixture()
      assert Forms.list_forms() == [form]
    end

    test "get_form!/1 returns the form with given id" do
      form = form_fixture()
      assert Forms.get_form!(form.id) == form
    end

    test "create_form/1 with valid data creates a form" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Form{} = form} = Forms.create_form(valid_attrs)
      assert form.name == "some name"
    end

    test "create_form/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_form(@invalid_attrs)
    end

    test "update_form/2 with valid data updates the form" do
      form = form_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Form{} = form} = Forms.update_form(form, update_attrs)
      assert form.name == "some updated name"
    end

    test "update_form/2 with invalid data returns error changeset" do
      form = form_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_form(form, @invalid_attrs)
      assert form == Forms.get_form!(form.id)
    end

    test "delete_form/1 deletes the form" do
      form = form_fixture()
      assert {:ok, %Form{}} = Forms.delete_form(form)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_form!(form.id) end
    end

    test "change_form/1 returns a form changeset" do
      form = form_fixture()
      assert %Ecto.Changeset{} = Forms.change_form(form)
    end
  end

  describe "forms" do
    alias ElixirGoogleForms.Forms.Form

    import ElixirGoogleForms.FormsFixtures

    @invalid_attrs %{active_until: nil, name: nil}

    test "list_forms/0 returns all forms" do
      form = form_fixture()
      assert Forms.list_forms() == [form]
    end

    test "get_form!/1 returns the form with given id" do
      form = form_fixture()
      assert Forms.get_form!(form.id) == form
    end

    test "create_form/1 with valid data creates a form" do
      valid_attrs = %{active_until: ~U[2021-11-08 05:35:00Z], name: "some name"}

      assert {:ok, %Form{} = form} = Forms.create_form(valid_attrs)
      assert form.active_until == ~U[2021-11-08 05:35:00Z]
      assert form.name == "some name"
    end

    test "create_form/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_form(@invalid_attrs)
    end

    test "update_form/2 with valid data updates the form" do
      form = form_fixture()
      update_attrs = %{active_until: ~U[2021-11-09 05:35:00Z], name: "some updated name"}

      assert {:ok, %Form{} = form} = Forms.update_form(form, update_attrs)
      assert form.active_until == ~U[2021-11-09 05:35:00Z]
      assert form.name == "some updated name"
    end

    test "update_form/2 with invalid data returns error changeset" do
      form = form_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_form(form, @invalid_attrs)
      assert form == Forms.get_form!(form.id)
    end

    test "delete_form/1 deletes the form" do
      form = form_fixture()
      assert {:ok, %Form{}} = Forms.delete_form(form)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_form!(form.id) end
    end

    test "change_form/1 returns a form changeset" do
      form = form_fixture()
      assert %Ecto.Changeset{} = Forms.change_form(form)
    end
  end
end
