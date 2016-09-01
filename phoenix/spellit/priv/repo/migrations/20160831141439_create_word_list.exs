defmodule Spellit.Repo.Migrations.CreateWordList do
  use Ecto.Migration

  def change do
    create table(:lists) do
      add :name, :string
      add :word_id, references(:words, on_delete: :nothing)

      timestamps()
    end
  end
end
