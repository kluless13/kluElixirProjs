defmodule ChatCli do
  # The main function to initialize the chat process.
  def start do
    # Spawn a new process for receiving messages.
    receive_pid = spawn(ChatCli, :receive_message, [])

    # Enter into the main loop for the chat CLI which handles user input.
    loop(receive_pid)
  end

  # A loop that handles user input and message sending.
  def loop(receiver) do
    # Prompt the user for input.
    IO.puts("Type your message (or type 'exit' to quit):")

    # Read the user's input.
    message = IO.gets(">> ")

    case String.trim(to_string(message)) do
      "exit" ->
        IO.puts("Exiting...")

      _ ->
        # Send the user's message to the receiving process.
        send(receiver, {:message, message})

        # Recursively call itself to keep asking the user for more messages.
        loop(receiver)
    end
  end

  # A function for the receiving process that listens for incoming messages.
  def receive_message do
    receive do
      {:message, content} ->
        # Print the received message.
        IO.puts("Received message: #{content}")

        # Recursively call itself to keep listening for more messages.
        receive_message()
    end
  end
end
