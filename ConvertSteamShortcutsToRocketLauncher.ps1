# Steam Shortcut to RocketLauncher Configuration Script

# Define the folder containing the .url files and the output file (current directory)
$shortcutsFolder = Get-Location
$outputFile = "D:\RetroCade\RetroCade FULL\RocketLauncher\Modules\PCLauncher\PC Games.ini"

# Initialize the output file if it doesn't exist
if (-not (Test-Path $outputFile)) {
    Set-Content -Path $outputFile -Value ""
}

# Process each .url file in the folder
Get-ChildItem -Path $shortcutsFolder -Filter "*.url" | ForEach-Object {
    $urlFile = $_.FullName

    # Read the content of the .url file
    $urlContent = Get-Content -Path $urlFile

    # Extract the name of the .url file (without extension)
    $name = $_.BaseName

    # Extract the URL from the [InternetShortcut] section (assuming the URL is under "URL=")
    $url = ($urlContent | Where-Object { $_ -match "^URL=" }) -replace "^URL=", ""

    # Check if the shortcut already exists in the output file
    $existingContent = Get-Content -Path $outputFile
    if ($existingContent -notcontains "[$name]") {
        # Append the details to the output file in the specified format
        Add-Content -Path $outputFile -Value "[$name]"
        Add-Content -Path $outputFile -Value "Application=$url"
        Add-Content -Path $outputFile -Value "AppWaitExe=steam.exe"
        Add-Content -Path $outputFile -Value ""  # Add a blank line for readability
    }
}

Write-Host "Shortcut details have been saved to $outputFile."
