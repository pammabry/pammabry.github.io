defmodule Spellit.Repo.Migrations.CreateWordList do
  use Ecto.Migration

  def change do
    create table(:word_lists) do
      add :name, :string
      add :word_id, references(:words, on_delete: :nothing), null: false

      timestamps()
    end
  end
end
