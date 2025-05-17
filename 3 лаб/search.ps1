param(
    [string]$searchPath,      # Путь к директории для поиска
    [string]$searchString,    # Искомая строка
    [string]$outputFile       # Файл для сохранения результатов
)

#проверка наличия обязательныйхпараметров
if (-not $searchPath -or -not $searchString -or -not $outputFile) {
    Write-Host "Использование: .\search.ps1 -searchPath <путь> -searchString <строка> -outputFile <файл>"
    exit 1
}

#проверка на существует ли директория
if (-not (Test-Path -Path $searchPath -PathType Container)) {
    Write-Host "Ошибка: директория '$searchPath' не существует или недоступна"
    exit 1
}

#поиск txt файлов, которые содержат искомую строку
try {
    $foundFiles = Get-ChildItem -Path $searchPath -Filter "*.txt" -Recurse -File | 
                  Where-Object { Select-String -Path $_.FullName -Pattern $searchString -Quiet }
    
    $foundFiles | Select-Object -ExpandProperty FullName | Out-File -FilePath $outputFile
    
    Write-Host "Поиск завершен. Найдено $($foundFiles.Count) файлов. Результаты сохранены в $outputFile"
}
catch {
    Write-Host "Ошибка при выполнении поиска: $_"
    exit 1
}