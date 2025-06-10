defmodule Iloveyou.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      IloveyouWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:iloveyou, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Iloveyou.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Iloveyou.Finch},
      # Start a worker by calling: Iloveyou.Worker.start_link(arg)
      # {Iloveyou.Worker, arg},
      # Start to serve requests, typically the last entry
      IloveyouWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Iloveyou.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    IloveyouWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
