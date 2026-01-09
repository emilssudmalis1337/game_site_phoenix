defmodule GameSiteWeb.GameLive.Show do
  use GameSiteWeb, :live_view

  alias GameSite.Games

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Game {@game.id}
        <:subtitle>This is a game record from your database.</:subtitle>
        <:actions>
          <.button navigate={~p"/games"}>
            <.icon name="hero-arrow-left" />
          </.button>
          <.button variant="primary" navigate={~p"/games/#{@game}/edit?return_to=show"}>
            <.icon name="hero-pencil-square" /> Edit game
          </.button>
        </:actions>
      </.header>

      <.list>
        <:item title="Title">{@game.title}</:item>
        <:item title="Genre">{@game.genre}</:item>
        <:item title="Platform">{@game.platform}</:item>
        <:item title="Players">{@game.players}</:item>
      </.list>
    </Layouts.app>
    """
  end

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Show Game")
     |> assign(:game, Games.get_game!(id))}
  end
end
