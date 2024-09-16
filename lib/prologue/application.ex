defmodule Prologue.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PrologueWeb.Telemetry,
      Prologue.Repo,
      {DNSCluster, query: Application.get_env(:prologue, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Prologue.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Prologue.Finch},
      # Start a worker by calling: Prologue.Worker.start_link(arg)
      # {Prologue.Worker, arg},
      # Start to serve requests, typically the last entry
      PrologueWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Prologue.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PrologueWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
