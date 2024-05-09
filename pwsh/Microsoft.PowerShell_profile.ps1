# 开启conda环境
# 第一组字符串为 conda.exe 所在目录
function condago{
    (& "C:\Env\miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}

# 设置环境变量脚本
# 永久生效
# 需要管理员权限
function set_path{ param (
            [string]$setpath
          )
        $currentPath = [System.Environment]::GetEnvironmentVariable("PATH", "Machine")
        $newPath = $currentPath + ";$setPath"

        if ($currentPath -split ";" -contains $setPath){
            Write-Host "The Path already contains the specified value"
        }else{
            Write-Host $newPath
                Write-Host ""
                $confirm = Read-Host "Please confirm you setting. (y/N)"
                if ($confirm -eq "Y" -or $confirm -eq "y"){
                    [System.Environment]::SetEnvironmentVariable("PATH", $newPath, "Machine")
                    Write-Host "Path updated. Please open a new PowerShell window for the changes to take effect."
                }
        }

}

# -Target = 源目录
# -Path = 目标目录
function set_link{
    param (
              [string]$target,
              [string]$source
          )
        New-Item -ItemType SymbolicLink -Target $source -Path $target
}

$appdata = $env:LOCALAPPDATA
$config = $HOME + "\Documents\1_config"
Import-Module scoop-completion
