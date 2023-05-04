defmodule KeyCombination.Repo do
  use Ecto.Repo,
    otp_app: :key_combination,
    adapter: Ecto.Adapters.Postgres
end
