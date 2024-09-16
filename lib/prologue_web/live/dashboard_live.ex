defmodule PrologueWeb.DashboardLive do
    use PrologueWeb, :live_view

    def render(assigns) do
        ~H"""
            <div>
                Hello admin
            </div>
        """
    end

    def mount(_params, _session, socket) do
        {:ok, socket}
    end
end