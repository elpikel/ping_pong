defmodule PingPong.Ping do

  def start do
    spawn(__MODULE__, :loop, [])
  end

  def loop do
    receive do
      {sender_pid, :ping} ->
        IO.puts("ping")
        IO.inspect(self())
        send(sender_pid, {self(), :pong})
      _ ->
        IO.puts("unknown process")
    end
    loop()
  end
end
