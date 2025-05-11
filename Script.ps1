# One thing I like to do is start off with all the variables and modules that I will be using throughout the script

# Install the excel module - if you don't have it already installed (reads .xlsx files) or you can save as .csv and use Import-Csv
# Install-Module ImportExcel

# Import-Excel or Import-Csv

$users = Import-Excel -Path "copy the path and put it here"
foreach ($user in $users) {
  $securePass = (Read-Host -AsSecureString "Please type the password - minimum 10 characters)
    New-ADUser `
        -Name "$($user.FirstName) $($user.LastName)" `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -SamAccountName $user.Username `
        -UserPrincipalName $user.UPN `
        -DisplayName "$($user.FirstName) $($user.LastName)" `
        -AccountPassword $securePassword `
        -Enabled $true `
        -Department $user.Department `
        -Title $user.Title `
        -Path "put OU path here"  
}
