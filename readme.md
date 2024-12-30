Documentation
Title: Steam Shortcut to RocketLauncher Configuration Script
Overview:
This PowerShell script is designed to automate the process of converting Steam .url shortcut files into the configuration format required by RocketLauncher. The .url files, which are typically created by Steam when adding shortcuts, are parsed to extract the URL, and this data is written into the PC Games.ini file, a configuration file used by RocketLauncher.
Features:
•	Reads .url Files: The script processes all .url files located in the directory where it is run.
•	Extracts Steam URLs: It extracts the URL value from the [InternetShortcut] section of the .url file, which contains the URL to launch the Steam game.
•	Writes to RocketLauncher Config: The script writes each shortcut as a new entry in the PC Games.ini configuration file. Each entry is added in the format that RocketLauncher expects to launch Steam games.
Key Sections of the Script:
1.	Shortcuts Folder: The script operates in the directory where it's run, and it reads all .url files in that directory.
2.	Output File: It appends new shortcut entries to the PC Games.ini file located at:
makefile
Copy code
D:\RetroCade\RetroCade FULL\RocketLauncher\Modules\PCLauncher\PC Games.ini
3.	URL Extraction: The script extracts the URL field from each .url file to determine the Steam game’s launch URL.
4.	File Format: The script ensures that the entries are added in RocketLauncher's required format:
csharp
Copy code
[GameName]
Application=steam://rungameid/<game_id>
AppWaitExe=steam.exe
Prerequisites:
•	RocketLauncher: This script requires RocketLauncher to be properly installed and configured.
•	Steam: The script assumes that the Steam application is used to launch the games, and steam.exe is the executable to be used when running the games.
•	.url Files: The script assumes that Steam shortcuts are saved as .url files in the same directory where the script is run.
How to Use:
1.	Place the script in the folder where your Steam .url shortcuts are stored.
2.	Run the script using PowerShell:
powershell
Copy code
.\ConvertSteamShortcutsToRocketLauncher.ps1
3.	The script will process all .url files in the current directory and append the formatted entries to the PC Games.ini file.
4.	After the script finishes, you can configure RocketLauncher to use the new entries for launching Steam games.
Example Output in PC Games.ini:
For a .url file named Doom.url, the script would append the following entry to the PC Games.ini:
csharp
Copy code
[Doom]
Application=steam://rungameid/2280
AppWaitExe=steam.exe
Notes:
•	The script checks if the game name already exists in the PC Games.ini file before adding the new entry to prevent duplicates.
•	You may need to adjust the path of the PC Games.ini file in the script to match your setup.
________________________________________
Repository Structure for GitHub:
bash
Copy code
/ConvertSteamShortcutsToRocketLauncher/
│
├── ConvertSteamShortcutsToRocketLauncher.ps1  # The PowerShell script
├── README.md                                 # Documentation for the script
README.md
markdown
Copy code
# Convert Steam Shortcuts to RocketLauncher Configuration

This PowerShell script automates the process of converting Steam `.url` shortcut files into RocketLauncher configuration entries. It reads each `.url` file, extracts the associated Steam URL, and appends the necessary details to the `PC Games.ini` file used by RocketLauncher.

## Features
- Processes `.url` Steam shortcut files in the current directory.
- Extracts the Steam URL and writes it to the RocketLauncher configuration.
- Ensures no duplicates are written to the `PC Games.ini` file.

## Prerequisites
- **RocketLauncher** installed and configured.
- **Steam** installed and used to launch games.
- `.url` files containing Steam shortcut URLs.

## Usage
1. Place the script in the directory containing your `.url` shortcut files.
2. Run the script in PowerShell:
   ```powershell
   .\ConvertSteamShortcutsToRocketLauncher.ps1
3.	The script will append the necessary entries to PC Games.ini for use with RocketLauncher.
Example Output
For a .url file named Doom.url, the script will add the following to PC Games.ini:
csharp
Copy code
[Doom]
Application=steam://rungameid/2280
AppWaitExe=steam.exe

