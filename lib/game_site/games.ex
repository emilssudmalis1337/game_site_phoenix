defmodule GameSite.Games do
  import Ecto.Query, warn: false
  alias GameSite.Repo
  alias GameSite.Games.Game

  defp broadcast_change({:ok, result}, event) do
    Phoenix.PubSub.broadcast(GameSite.PubSub, "games", {event, result})
    {:ok, result}
  end

  defp broadcast_change({:error, reason}, _event), do: {:error, reason}

  def list_games do
    Repo.all(Game)
  end

  def get_game!(id), do: Repo.get!(Game, id)

  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
    |> broadcast_change(:game_created)  
  end

  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
    |> broadcast_change(:game_updated)  
  end

  def delete_game(%Game{} = game) do
    Repo.delete(game)
    |> broadcast_change(:game_deleted)  
  end

  def change_game(%Game{} = game, attrs \\ %{}) do
    Game.changeset(game, attrs)
  end
end