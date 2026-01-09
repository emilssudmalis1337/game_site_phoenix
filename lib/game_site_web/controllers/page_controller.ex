defmodule GameSiteWeb.PageController do
  use GameSiteWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
