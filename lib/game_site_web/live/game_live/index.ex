defmodule GameSiteWeb.GameLive.Index do
  use GameSiteWeb, :live_view

  alias GameSite.Games

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(GameSite.PubSub, "games")
    end

    {:ok,
     socket
     |> assign(:page_title, "Listing Games")
     |> stream(:games, Games.list_games())}
  end

  @impl true
  def handle_info({:game_created, game}, socket) do
    {:noreply, stream_insert(socket, :games, game, at: 0)}
  end

  @impl true
  def handle_info({:game_updated, game}, socket) do
    {:noreply, stream_insert(socket, :games, game)}
  end

  @impl true
  def handle_info({:game_deleted, game}, socket) do
    {:noreply, stream_delete(socket, :games, game)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    game = Games.get_game!(id)
    {:ok, _} = Games.delete_game(game)

    {:noreply, stream_delete(socket, :games, game)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Listing Games
        <:actions>
          <.button variant="primary" navigate={~p"/games/new"}>
            <.icon name="hero-plus" /> New Game
          </.button>
        </:actions>
      </.header>

      <.table
        id="games"
        rows={@streams.games}
        row_click={fn {_id, game} -> JS.navigate(~p"/games/#{game}") end}
      >
        <:col :let={{_id, game}} label="Title">{game.title}</:col>
        <:col :let={{_id, game}} label="Genre">{game.genre}</:col>
        <:col :let={{_id, game}} label="Platform">{game.platform}</:col>
        <:col :let={{_id, game}} label="Players">{game.players}</:col>
        <:action :let={{_id, game}}>
          <div class="sr-only">
            <.link navigate={~p"/games/#{game}"}>Show</.link>
          </div>
          <.link navigate={~p"/games/#{game}/edit"}>Edit</.link>
        </:action>
        <:action :let={{id, game}}>
          <.link
            phx-click={JS.push("delete", value: %{id: game.id}) |> hide("##{id}")}
            data-confirm="Are you sure?"
          >
            Delete
          </.link>
        </:action>
      </.table>
    </Layouts.app>
    """
  end
end
