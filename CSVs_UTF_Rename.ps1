$sourceFolder = "C:\path\to\files"      # <-- Folder with original CSVs
$destinationFolder = "C:\NetworkTitan\DB\NEW CSV FORMAT" # <-- Folder for cleaned files

# Create destination folder if it doesn't exist
if (!(Test-Path $destinationFolder)) {
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Process all CSV files
Get-ChildItem -Path $sourceFolder -Filter *.csv | ForEach-Object {
    
    $inputFile = $_.FullName
    $fileName = $_.BaseName
    $outputFile = Join-Path $destinationFolder ($fileName + "_CLEAN.csv")

    # Read file and write as UTF-8
    Get-Content $inputFile | Set-Content -Encoding utf8 $outputFile

    Write-Host "Converted: $($_.Name) -> $($fileName)_CLEAN.csv"
}

Write-Host "All files processed."
