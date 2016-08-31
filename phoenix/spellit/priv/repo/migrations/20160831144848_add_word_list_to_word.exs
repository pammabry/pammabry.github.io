defmodule Spellit.Repo.Migrations.AddWordListToWord do
  use Ecto.Migration

  def change do
    alter table(:words) do
      add :word_list_id, references(:word_lists, on_delete: :nothing)
    end
  end
end
