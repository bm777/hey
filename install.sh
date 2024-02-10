#!/bin/bash

# Copy the main script to a location in the PATH
sudo chmod +x hey.sh
sudo cp commands.toml /usr/local/bin
sudo cp hey.sh /usr/local/bin/hey

echo "Installation completed. You can now use 'hey' in your terminal."
