defmodule PhxLiveMnesia.Application do
  @moduledoc false

  use Application
  alias PhxLiveMnesia.Mnesia.Setup, as: MnesiaSetup

  def start(_type, _args) do
    MnesiaSetup.initialize()

    children = [
      PhxLiveMnesiaWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: PhxLiveMnesia.Supervisor]

    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhxLiveMnesiaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
