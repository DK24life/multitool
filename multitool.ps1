$menu = "------------------------------`nMultitool version 2`nPlease, select a function:`n[1] Create user`n[2] Delete user`n[3] Download a file with WebRequest`n[4] Output all processes on host`n------------------------------"

Write-Host $menu

while (1) {
        $Choice = Read-Host -Prompt "Enter your choice (0-4)"

        switch($Choice) {
        1 {
            $newusername = Read-Host -Prompt "Enter username (new)"
            if ( -not [string]::IsNullOrWhiteSpace($newusername)) {
            New-LocalUser -name $newusername
            Write-Host "User $newusername created successfully"
            } else {
            Write-Host "The value is empty. Repeat the input."
            } 
        }
        2 {
            $delusername = Read-Host -Prompt "Enter username (del)"
            if ( -not [string]::IsNullOrWhiteSpace($delusername)) {
            Remove-LocalUser -Name $delusername
            } else {
            Write-Host "The value is empty. Repeat the input."
            }
        }
        3 { 
            $file_url = Read-Host -Prompt "Enter file URL"
            if ( -not [string]::IsNullOrWhiteSpace($file_url)) {
            Invoke-WebRequest -Uri $file_url -OutFile (Split-Path $file_url -Leaf)
            } else {
            Write-Host "The value is empty. Repeat the input."
            }
        }
        4 {
            Get-Process | Format-Table Name, Id, CPU, StartTime -AutoSize
        }
        0 {
            Write-Host "Goodbye!"
            exit
        }
        Default { Write-Host "Invalid choice" }
        }
}
