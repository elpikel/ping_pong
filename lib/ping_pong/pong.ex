defmodule PingPong.Pong do

  def start do
    spawn(__MODULE__, :loop, [])
  end

  def loop do
    receive do
      {sender_pid, :pong} ->
        IO.puts("pong")
        IO.inspect(self())
        send(sender_pid, {self(), :ping})
      _ ->
        IO.puts("unknown process")
    end
    loop()
  end
end
