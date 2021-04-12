defmodule DemoWeb.PageController do
  use DemoWeb, :controller

  def index(conn, _params) do
    text(conn, "hello world")
  end
end
