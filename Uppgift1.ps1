#Be användaren om ett namn för mappen och spara detta som $folderName
$folderName = Read-Host "Vad ska huvudmappen heta?"

# Vad är sökvägen till huvudmappen som skapas? Spara den som $mainFolder.
$mainFolder = "$PWD\$folderName"

# Skapa huvudmappen
New-Item $mainFolder -ItemType Directory


# Funktion för att skapa undermapparna
function Create-Subfolders {

    # Lista på mapparna som skall skapas
    $subfolders = @("logs", "script", "temp")

    foreach ($name in $subfolders) {
        $fullPath = "$mainFolder\$name"

        try {
            # Försök skapa mappen
            New-Item -Path $fullPath -ItemType Directory -ErrorAction Stop
            Write-Host "Skapade $fullPath"
        }
        catch {
            # Om det misslyckas, varna användaren
            Write-Host "Kunde inte skapa $fullPath"
        }
    }
}


# Använd funktionen ovan för att skapa undermapparna
Create-SubFolders

# Vi behöver dagens datum i rätt format för att döpa och skapa loggfilen. Även klockslag behövs senare
$date = Get-Date -Format "yyyy-MM-dd"
$time = Get-Date -Format "hh:mm:ss"

# Specificera vart loggen skall sparas och vad den skall heta, och spara den som variabeln $logFile så att vi slipper skriva hela pathen
$logFile = "$mainFolder\logs\log-$date.txt"

# ...Och skapa den.
New-Item $logFile -ItemType File

#Slutligen, skriv när strukturen skapades till loggfilen
Add-Content -Path $logFile -Value "Struktur skapad: $date $time"