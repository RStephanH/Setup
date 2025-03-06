import subprocess

def launch_terminal_and_confirm():
    # Launch a terminal emulator (e.g., konsole, xterm, etc.)
    terminal_command = ["konsole", "-e"]

    # Command to run in the terminal
    command_to_run = ["bash", "-c", "./snapshot.sh; read -p 'Press enter to continue'"]

    # Combine the commands
    full_command = terminal_command + command_to_run
    print(full_command)

    # Ask for user confirmation
    confirm = input("Do you want to run the 'Hello, World!' script? (yes/no): ").strip().lower()

    if confirm == 'yes':
        try:
            # Launch the terminal with the command
            subprocess.run(full_command, check=True)
        except subprocess.CalledProcessError as e:
            print(f"An error occurred: {e}")
    else:
        print("Operation cancelled.")

if __name__ == "__main__":
    launch_terminal_and_confirm()

