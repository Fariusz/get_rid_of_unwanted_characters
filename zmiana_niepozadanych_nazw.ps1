#SKRYPT: Oczyszczanie nazw plików i folderów ze spacji oraz polskich znaków

#Tablica znaków niepożądanych
$zleZnaki = @(' ','ą','ć','ę','ł','ń','ó','ś','ź','ż','(',')','[',']','{','}')

#Tablica znaków pożądanych
$dobreZnaki = @('_','a','c','e','l','n','o','s','z','z','_','','_','','_','')

for ($i=0; $zleZnaki.Count -gt $i; $i++)
{
    #Ścieżka do folderu nadrzędnego z flagą Recurse pozwalającą na przeszukiwanie wgłąb hierarchi folderów
    Get-ChildItem -Path .\ -Recurse |
    Where-Object { $_.name.Contains($zleZnaki[$i]) } |
    Rename-Item -NewName { $_.name -replace [regex]::Escape($zleZnaki[$i]),$dobreZnaki[$i] }
}






