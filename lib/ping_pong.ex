defmodule PingPong do
  def start do
    ping_server = PingPong.Ping.start
    pong_server = PingPong.Pong.start

    send(pong_server, {ping_server, :pong})
  end
end
