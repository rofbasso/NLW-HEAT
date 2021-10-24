defmodule HeatTagsElixirWeb.MessagesView do
  use HeatTagsElixirWeb, :view

  def render("create.json", %{message: message}) do
    %{
      result: "Message created!",
      message: message
    }
  end
end
