defmodule Spellit.WordListController do
  use Spellit.Web, :controller
  alias Spellit.WordList

  def index(conn, _params) do
    word_lists = Repo.all(WordList)
    render(conn, "index.html", word_lists: word_lists)
  end
  
  def new(conn, _params) do
    changeset = WordList.changeset(%WordList{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"word_list" => word_list_params} = params) do
    case create_word_list(word_list_params) do
      {:ok, word_list} ->
        conn
        |> put_flash(:info, gettext("List created."))
        |> redirect(to: redirect_path(conn, params["add_another"]))
      {:error, changeset} ->
        conn
        |> render(:new, changeset: changeset)
    end
  end

  def create_word_list(word_list_params) do
    WordList.changeset(%WordList{}, word_list_params)
    |> Repo.insert
  end

  defp redirect_path(conn, nil) do
    word_list_path(conn, :index)
  end
  
  defp redirect_path(conn, _add_another) do
    word_list_path(conn, :index)
  end

  def show(conn, %{"id" => id}) do
    word_list = Repo.get!(WordList, id)
    render(conn, "show.html", word_list: word_list)
  end

  def delete(conn, %{"id" => id}) do
    word_list = Repo.get!(WordList, id)
    Repo.delete!(word_list)
    
    conn
    |> put_flash(:info, gettext("List deleted."))
    |> redirect(to: word_list_path(conn, :index))
  end
end
