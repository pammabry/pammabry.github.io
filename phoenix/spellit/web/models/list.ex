defmodule Spellit.List do
  use Spellit.Web, :model
  alias Spellit.Word

  schema "wordlists" do
    field :name, :string
    has_many :words, Spellit.Word, on_delete: :delete_all
  
    timestamps
  end
end
