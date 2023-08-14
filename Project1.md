start/0: This function spawns two processes, one for sending and one for receiving messages. The sending process is informed of the receiving process's PID so that it can send messages to it.

send_message/0: This is a recursive function where the sending process waits to receive the PID of the receiving process. Once received, it prompts the user for a message and sends it to the receiving process.

receive_message/0: This is also a recursive function where the receiving process waits to receive a message. When a message is received, it displays it to the user.