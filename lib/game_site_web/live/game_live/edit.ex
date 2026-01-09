defmodule GameSiteWeb.GameLive.Edit do
  use GameSiteWeb, :live_view
  alias GameSite.Games

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _, socket) do
    game = Games.get_game!(id)
    {:noreply, assign(socket, game: game)}
  end

  def handle_event("update", params, socket) do
    Games.update_game(socket.assigns.game, params)
    |> case do
      {:ok, _} -> {:noreply, push_navigate(socket, to: ~p"/games")}
      {:error, _} -> {:noreply, socket}
    end
  end

  def render(assigns) do
  ~H"""
  <div style="max-width: 600px; margin: 0 auto; padding: 40px;">
    <h1 style="text-align: center; font-size: 24px; margin-bottom: 30px; color: black;">
      Edit Game
    </h1>
    
    <form phx-submit="update" style="background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">
      <div style="display: grid; gap: 20px;">
        <div>
          <label style="display: block; margin-bottom: 8px; font-weight: 500; color: black;">Title</label>
          <input 
            name="title" 
            value={@game.title} 
            required 
            style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; color: black;"
          />
        </div>
        
        <div>
          <label style="display: block; margin-bottom: 8px; font-weight: 500; color: black;">Genre</label>  
          <input 
            name="genre" 
            value={@game.genre} 
            style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; color: black;"
          />
        </div>
        
        <div>
          <label style="display: block; margin-bottom: 8px; font-weight: 500; color: black;">Platform</label>
          <input 
            name="platform" 
            value={@game.platform} 
            style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; color: black;"
          />
        </div>
        
        <div>
          <label style="display: block; margin-bottom: 8px; font-weight: 500; color: black;">Players</label>
          <input 
            name="players" 
            value={@game.players} 
            type="number"
            style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; color: black;"
          />
        </div>
        
        <button 
          type="submit"
          style="background: #3b82f6; color: white; padding: 12px 24px; border: none; border-radius: 6px; font-size: 16px; cursor: pointer; margin-top: 10px;"
        >
          Save Changes
        </button>
      </div>
    </form>
  </div>
  """
end
end