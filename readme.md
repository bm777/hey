# Hey

Hey is a simple command-line utility that allows you to store, list custom commands easily.
It is somehow difficult to remember all the commands that you use in your daily work, so Hey is here to help you with that.
Just store them using `hey add <label> '<command>'` and then list them using `hey ls`.

I use it for personal use, but I hope it can be useful for you too.

## Installation

To install Hey, follow these steps:

1. Clone the repository:
```bash
git clone https://github.com/bm777/hey.git
```

2. Change to the repository directory:
```bash
cd hey
```

3. Run the installation script:
This will copy the `hey.sh` script to `/usr/local/bin`, making it accessible system-wide.
```bash
./install.sh
```

## Usage

To use Hey, you can use the following commands:

- `hey add <label> '<command>'`: Add a new command to the list.
- `hey ls`: List all the commands.
- `hey rm <label>`: Remove a command from the list. (WIP)
- `hey <label>`: Show the command for the given label.


## Contributing
Contributions are welcome! If you encounter any issues or have suggestions for improvement, feel free to open an issue or submit a pull request.