# Linux App Selector

A bash script designed to automate the installation of common applications on Fedora systems. This script provides an interactive interface for users to select which applications they want to install using a simple checklist powered by **whiptail**. (Only Docker at the moment)
The script also installs necessary packages like whiptail, wget and curl.

## Features

- **Interactive App Selection**: Choose applications to install from a list using checkboxes.
- **Automated Installations**: Installs selected applications automatically with necessary configurations.

## Planned Features
- **Multiple Applications**: Currently supports Docker, with room to expand for other applications.
- **Multiple Systems**: Currently supports Fedora, with room to expand for other systems.

## Systems Supported

- **Fedora**

## Applications Supported

- **Docker**

## Prerequisites

Before running the script, ensure the following:

- You are using a **Fedora** system.
- The script requires `sudo` privileges to install packages.

## How to Use

1. **Make the script executable**:

   ```bash
   chmod ug+x app-select.sh
   ```

2. **Run the script**:

   ```bash
   ./app-select.sh
   ```

3. **Select applications**:

   - When the interactive menu appears, use the spacebar to select the apps you want to install.
   - You can press Tab to either `Cancel` or `Confirm` the selection.
   - Press **Enter** to start the installation.

## Expanding the Script

You can easily add more applications to the script by defining new install commands in the `apps` array within the script.

```bash
apps["AppName"]="installation_command"
```

## License

This project is licensed under the MIT License.

## Contributions

Feel free to contribute by adding support for more applications or improving the script. Submit pull requests or open issues for any bugs or feature requests.