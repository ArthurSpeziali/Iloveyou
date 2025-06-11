defmodule IloveyouWeb.Live.Surprise do
    use IloveyouWeb, :live_view

    
    def mount(_params, _session, socket) do
        socket = assign(socket,
            name: System.get_env("LOVE_NAME") || "XXX"
        )

        {:ok, socket, layout: false}
    end
end
