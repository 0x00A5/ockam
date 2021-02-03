defmodule Ockam.SecureChannel.KeyEstablishmentProtocol.XX do
  @moduledoc false

  alias Ockam.SecureChannel.KeyEstablishmentProtocol.XX.Initiator
  alias Ockam.SecureChannel.KeyEstablishmentProtocol.XX.Protocol
  alias Ockam.SecureChannel.KeyEstablishmentProtocol.XX.Responder
  alias Ockam.Serializable

  def setup(options, data) do
    # TODO:
    options =
      Keyword.put(options, :message2_payload, Serializable.serialize(data.plaintext_address))

    with {:ok, data} <- Protocol.setup(options, data) do
      case Keyword.get(options, :role, :initiator) do
        :initiator -> Initiator.setup(options, data)
        :responder -> Responder.setup(options, data)
        unexpected_role -> {:error, {:role_option_has_an_unexpected_value, unexpected_role}}
      end
    end
  end

  def handle_message(message, {:key_establishment, role, _role_state} = state, data)
      when role in [:initiator, :responder] do
    case role do
      :initiator -> Initiator.handle_message(message, state, data)
      :responder -> Responder.handle_message(message, state, data)
    end
  end
end
