defmodule IloveyouWeb.Live.Main do
    use IloveyouWeb, :live_view


    def mount(_params, _session, socket) do
        {:ok, socket, layout: false}
    end
end
