defmodule PhxLibrary.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhxLibrary.Repo,
      # Start the Telemetry supervisor
      PhxLibraryWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxLibrary.PubSub},
      # Start the Endpoint (http/https)
      PhxLibraryWeb.Endpoint
      # Start a worker by calling: PhxLibrary.Worker.start_link(arg)
      # {PhxLibrary.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxLibrary.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxLibraryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
