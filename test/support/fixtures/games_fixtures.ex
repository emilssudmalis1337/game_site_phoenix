defmodule GameSite.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GameSite.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        genre: "some genre",
        platform: "some platform",
        players: 42,
        title: "some title"
      })
      |> GameSite.Games.create_game()

    game
  end
end
