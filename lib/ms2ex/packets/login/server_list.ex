defmodule Ms2ex.Packets.ServerList do
  import Ms2ex.Packets.PacketWriter

  @mod_set 0x1

  def bytes() do
    config = Application.get_env(:ms2ex, Ms2ex)
    login_servers = [config[:login]]
    [world | _] = config[:worlds]
    unknown_data = Enum.shuffle(1..9)

    __MODULE__
    |> build()
    |> put_byte(@mod_set)
    |> put_int(0x1)
    |> put_ustring(world.name)
    |> put_byte(0x4)
    |> put_short(length(login_servers))
    |> put_servers(login_servers)
    |> put_int(100)
    |> put_short(length(unknown_data))
    |> reduce(unknown_data, fn byte, packet ->
      put_short(packet, byte)
    end)
  end

  defp put_servers(packet, []), do: packet

  defp put_servers(packet, [server | servers]) do
    packet
    |> put_ustring(server.host)
    |> put_short(server.port)
    |> put_servers(servers)
  end
end