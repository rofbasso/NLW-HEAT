defmodule HeatTagsElixir.Repo do
  use Ecto.Repo,
    otp_app: :heat_tags_elixir,
    adapter: Ecto.Adapters.Postgres
end
