defmodule GameSite.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :title, :string
    field :genre, :string
    field :platform, :string
    field :players, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:title, :genre, :platform, :players])
    |> validate_required([:title, :genre, :platform, :players])
  end
end
