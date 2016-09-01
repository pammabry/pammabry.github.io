defmodule Spellit.Repo.Migrations.AddWordListToWord do
  use Ecto.Migration

  def change do
    alter table(:words) do
      add :list_id, references(:lists, on_delete: :nothing)
    end
  end
end
