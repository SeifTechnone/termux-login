import curses
import time
import os
import signal
import sys

def handle_exit(signal, frame):
    # Exit
    sys.exit()

# Set up signal handlers
signal.signal(signal.SIGINT, handle_exit)  # Ctrl + C
signal.signal(signal.SIGTSTP, handle_exit)  # Ctrl + Z

def animate_login_screen(stdscr):
    # Clear the screen
    stdscr.clear()

    # Set timeout for user input to 5 seconds
    stdscr.timeout(10000)

    # Get screen dimensions
    height, width = stdscr.getmaxyx()

    # Set up text
    login_text = "Termux Login"
    username_text = "Username: "
    password_text = "Password: "

    # Predefined username and password
    username = "termux"
    correct_password = "1234"
    attempts = 3

    password = ""  # تعريف المتغير password هنا

    # Calculate the positions of text elements
    login_x = width // 2 - len(login_text) // 2
    username_x = width // 2 - len(username_text)
    password_x = width // 2 - len(password_text)
    text_y = height // 2

    # Define the logo
    logo = [
        "██████████████",
        "██          ██",
        "██  ██      ██",
        "██  ██      ██",
        "██          ██",
        "██          ██",
        "██████████████"
    ]

    # Calculate the position of the logo
    logo_y = text_y - len(logo) - 1
    logo_x = width // 2 - len(logo[0]) // 2

    # Animation loop
    while attempts > 0:
        # Clear the screen
        stdscr.clear()

        # Print logo
        for i, line in enumerate(logo):
            stdscr.addstr(logo_y + i, logo_x, line)

        # Print login text
        stdscr.addstr(text_y - 10, login_x, login_text)

        # Print username input
        stdscr.addstr(text_y + 0, username_x, username_text + username)

        # Print password input
        stdscr.addstr(text_y + 1, password_x, password_text + "*" * len(password))

        # Refresh the screen
        stdscr.refresh()

        # Wait for user input
        key = stdscr.getch()

        # Check if Enter key is pressed
        if key == ord('\n'):
            # Check password
            if password == correct_password:
                # Run bash script for successful login
                os.system("bash $PREFIX/bin/termux-user-unlock")
                stdscr.clear()
                success_message = "Login successful!"
                success_x = width // 2 - len(success_message) // 2
                stdscr.addstr(text_y + 3, success_x, success_message)
                stdscr.refresh()
                time.sleep(2)
                break
            else:
                attempts -= 1
                stdscr.clear()
                fail_message = "Wrong password! Attempts left: " + str(attempts)
                fail_x = width // 2 - len(fail_message) // 2
                stdscr.addstr(text_y + 3, fail_x, fail_message)
                stdscr.refresh()
                time.sleep(2)
                password = ""
        # Check if backspace key is pressed
        elif key == curses.KEY_BACKSPACE or key == 127:
            password = password[:-1]  # Remove the last character
        else:
            password += chr(key)  # Append the typed character to the password

    if attempts == 0:
        # Run bash script for failed attempts
        stdscr.clear()
        fail_message = "Login failed! No attempts left."
        fail_x = width // 2 - len(fail_message) // 2
        stdscr.addstr(text_y + 3, fail_x, fail_message)
        stdscr.refresh()
        time.sleep(2)

    # Exit
    sys.exit()

# Initialize curses and run the animation
curses.wrapper(animate_login_screen)
