defmodule Spellit.Word do
  use Spellit.Web, :model

  schema "words" do
    field :word, :string
    has_many :lists, Spellit.List, on_delete: :delete_all

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:word])
  end
end
