defmodule Spellit.List do
  use Spellit.Web, :model
  alias Spellit.Word

  schema "lists" do
    field :name, :string
    has_many :words, Spellit.Word, on_delete: :delete_all
  
    timestamps
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
  end
end
