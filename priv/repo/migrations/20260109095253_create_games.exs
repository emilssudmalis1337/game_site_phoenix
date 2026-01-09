defmodule GameSite.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :title, :string
      add :genre, :string
      add :platform, :string
      add :players, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
