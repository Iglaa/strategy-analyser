defmodule StrategyAnalyser.Repo do
  use Ecto.Repo,
    otp_app: :strategy_analyser,
    adapter: Ecto.Adapters.Postgres
end
