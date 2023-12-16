defmodule StrategyAnalyserWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StrategyAnalyserWeb.Telemetry,
      # Start a worker by calling: StrategyAnalyserWeb.Worker.start_link(arg)
      # {StrategyAnalyserWeb.Worker, arg},
      # Start to serve requests, typically the last entry
      StrategyAnalyserWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StrategyAnalyserWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StrategyAnalyserWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
