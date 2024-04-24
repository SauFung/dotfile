$currentPath = $PWD
$nvim_source = "$currentPath\nvim"
$nvim_target = $env:LOCALAPPDATA + "\nvim"
Function Init{
	param(
		$Param
	)
	if ($Param -eq "nvim"){
		New-Item -ItemType SymbolicLink -Target $nvim_source -Path $nvim_target
	}

}


Init -Param $args[0] 

