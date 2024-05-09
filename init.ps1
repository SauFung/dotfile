# nvim 源路径和设置路径
$nvim_source = "$PWD\nvim"
$nvim_target = $env:LOCALAPPDATA + "\nvim"

# pwsh 源路径和设置路径
$pwsh_source = "$PWD\pwsh"
$pwsh_target = "$HOME\Documents\PowerShell"


Function Init{
	param(
		$Param
	)
	if ($Param -eq "nvim"){
		New-Item -ItemType SymbolicLink -Target $nvim_source -Path $nvim_target
        Write-Output "nvim set done!"
	}elseif ($Param -eq "pwsh"){
		New-Item -ItemType SymbolicLink -Target $pwsh_source -Path $pwsh_target
        Write-Output "pwsh set done!"
    }else{
        Write-Output "Input Error! Please try again."
    }

}


Init -Param $args[0]

