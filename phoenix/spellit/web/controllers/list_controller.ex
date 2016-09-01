defmodule Spellit.ListController do
  use Spellit.Web, :controller
  alias Spellit.List

  def index(conn, _params) do
    lists = Repo.all(List)
    render(conn, "index.html", lists: lists)
  end
  
  def new(conn, _params) do
    changeset = List.changeset(%List{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"list" => list_params} = params) do
    case create_list(list_params) do
      {:ok, list} ->
        conn
        |> put_flash(:info, gettext("List created."))
        |> redirect(to: redirect_path(conn, params["add_another"]))
      {:error, changeset} ->
        conn
        |> render(:new, changeset: changeset)
    end
  end

  def create_list(list_params) do
    List.changeset(%List{}, list_params)
    |> Repo.insert
  end

  defp redirect_path(conn, nil) do
    list_path(conn, :index)
  end
  
  defp redirect_path(conn, _add_another) do
    list_path(conn, :index)
  end

  def show(conn, %{"id" => id}) do
    list = Repo.get!(List, id)
    render(conn, "show.html", list: list)
  end

  def delete(conn, %{"id" => id}) do
    list = Repo.get!(List, id)
    Repo.delete!(list)
    
    conn
    |> put_flash(:info, gettext("List deleted."))
    |> redirect(to: list_path(conn, :index))
  end
end
