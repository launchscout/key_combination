defmodule KeyCombination.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      KeyCombinationWeb.Telemetry,
      # Start the Ecto repository
      KeyCombination.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: KeyCombination.PubSub},
      # Start Finch
      {Finch, name: KeyCombination.Finch},
      # Start the Endpoint (http/https)
      KeyCombinationWeb.Endpoint
      # Start a worker by calling: KeyCombination.Worker.start_link(arg)
      # {KeyCombination.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KeyCombination.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KeyCombinationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
