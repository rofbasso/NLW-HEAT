defmodule HeatTagsElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      HeatTagsElixir.Repo,
      # Start the Telemetry supervisor
      HeatTagsElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: HeatTagsElixir.PubSub},
      # Start the Endpoint (http/https)
      HeatTagsElixirWeb.Endpoint
      # Start a worker by calling: HeatTagsElixir.Worker.start_link(arg)
      # {HeatTagsElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HeatTagsElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HeatTagsElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
