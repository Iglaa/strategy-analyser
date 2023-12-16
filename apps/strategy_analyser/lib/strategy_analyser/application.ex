defmodule StrategyAnalyser.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StrategyAnalyser.Repo,
      {DNSCluster, query: Application.get_env(:strategy_analyser, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: StrategyAnalyser.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: StrategyAnalyser.Finch}
      # Start a worker by calling: StrategyAnalyser.Worker.start_link(arg)
      # {StrategyAnalyser.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: StrategyAnalyser.Supervisor)
  end
end
