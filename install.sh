#!/bin/bash

# Copy the main script to a location in the PATH
sudo chmod +x hey.sh

cp .commands.toml ~/.commands.toml
sudo cp hey.sh /usr/local/bin/hey

echo "Installation completed. You can now use 'hey' in your terminal."
