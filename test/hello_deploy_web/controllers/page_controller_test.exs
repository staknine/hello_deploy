defmodule HelloDeployWeb.PageControllerTest do
  use HelloDeployWeb.ConnCase

  import HelloDeploy.AccountsFixtures
  setup :register_and_log_in_user

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
