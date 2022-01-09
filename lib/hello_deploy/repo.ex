defmodule HelloDeploy.Repo do
  use Ecto.Repo,
    otp_app: :hello_deploy,
    adapter: Ecto.Adapters.Postgres
end
