defmodule ElixirGoogleFormsWeb.PageController do
  use ElixirGoogleFormsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
