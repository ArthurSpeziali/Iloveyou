defmodule IloveyouWeb.Live.Cards do
    use IloveyouWeb, :live_view


    def mount(_params, _session, socket) do
        card_list = JSON.decode!(
            File.read!("priv/data/cards.json")
        )

        socket = assign(socket,
            card_list: card_list,
            index: 0
        )

        {:ok, socket, layout: false}
    end


    def handle_event("next", _params, socket) do
        index = socket.assigns[:index]

        {:noreply,
            assign(socket, index: index + 1)
        }
    end

    def handle_event("previous", _params, socket) do
        index = socket.assigns[:index]

        {:noreply,
            assign(socket, index: index - 1)
        }
    end

    def handle_event("bonus", _params, socket) do
        {:noreply,
            push_navigate(socket, to: "/bonus")
        }
    end
end
