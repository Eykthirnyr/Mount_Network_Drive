# Mount_Network_Drive
Smart Network Drive Mounter with Error Handling for Windows

## Features of the Enhanced Batch Script:

- **Network Reachability Check**: Ensures the NAS (Network Attached Storage) is reachable before attempting to mount.
- **Drive Letter Validity Check**: Verifies if the specified drive letter is not already in use or invalid.
- **Workstation Service Check**: Confirms that the Windows Workstation service is running (required for network shares).
- **Network Services Check**: Ensures network services are available and functioning.
- **Already Mounted Drive Check**: Prevents mounting the drive if it is already mounted.
- **Mount Network Drive**: Automatically mounts the specified network drive using the given credentials.
- **Authentication Failure Handling**: Detects if the provided username or password is incorrect.
- **Incorrect Share Path Handling**: Alerts if the network share path is invalid or cannot be found.
- **Drive Letter In-Use Detection**: Detects if the chosen drive letter is already assigned to another network share.
- **General Error Handling**: Provides troubleshooting messages for unknown errors.


-------------------

# Setup and Usage Guide for Non-Technical Users:

Open Notepad:

Open your Windows start menu and search for "Notepad" to launch it.
Copy the Script:

Copy the batch script code provided into Notepad.
Set Your Variables:

Replace the following variables with your specific details:
DRIVE_LETTER: The letter you want to assign to the network drive (e.g., K:).
NAS_IP: The IP address of your NAS or network server (e.g., 192.168.121.104).
SHARE_NAME: The name of the shared folder on the NAS you want to access (e.g., scan).
USERNAME: Your NAS username for authentication.
PASSWORD: Your NAS password for authentication.
Save the File:

Save the file by going to File > Save As.
In the "Save as type" dropdown, select All Files.
Save the file with a .bat extension (e.g., MountNetworkDrive.bat).
Run the Script:

Double-click the .bat file you just created to run the script.
Follow the Prompts:

The script will automatically check the network and mount the network drive. If an error occurs, you will see a clear message indicating what went wrong (e.g., "Authentication failed" or "Network path not found").
Access the Mounted Drive:

If the script runs successfully, the network drive will appear in This PC under the specified drive letter (e.g., K:). You can then access the files stored on the NAS as if they were on your computer.
Troubleshooting:

If an error message is displayed, follow the suggestion on the screen to correct the issue, such as:
Checking your username/password if there's an authentication error.
Verifying the network cable if the NAS isn't reachable.

Clément GHANEME - 2024/09
