defmodule HeatTagsElixirWeb.MessagesController do
  use HeatTagsElixirWeb, :controller

  alias HeatTagsElixir.Message
  alias HeatTagsElixir.Message.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_create(conn)
  end

  defp handle_create({:ok, %Message{}}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", message: message)
  end

  defp handle_create({:error, %{result: result, status: status}}, conn) do
  end
end
