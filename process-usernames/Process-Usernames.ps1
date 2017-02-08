# Author: Guillermo Robles
#
# Description: Process a file and add names by nips

# Ok, I have to recognize that this is awesome
param (
    [Parameter(Mandatory=$true)][string]$file
)

$BD_FILE = "./humans"

# Load students
$students = Get-Content -Raw -Path $BD_FILE | ConvertFrom-StringData

# Add names to the file and output to stdout
(Get-Content -Raw -Path $file) | ForEach-Object {
    $nip = [regex]::match($_,'[0-9]{6}').Groups[0].Value # Regexes are love, regexes are life
    If ($students.ContainsKey($nip)) {
    	Write-Output "$($_)  ($($students[$nip]))"
    } Else {
	Write-Output "$($_)"
    }
}
