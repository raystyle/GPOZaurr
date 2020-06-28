﻿Import-Module "$PSScriptRoot\..\GPoZaurr.psd1" -Force

$Output = Invoke-GPOZaurr #-NoTranslation

New-HTML {
    foreach ($GPOCategory in $Output.Keys) {
        New-HTMLTab -Name $GPOCategory {
            foreach ($GpoSettings in $Output.$GPOCategory.Keys) {
                New-HTMLTab -Name $GpoSettings {
                    New-HTMLTable -DataTable $Output[$GPOCategory][$GpoSettings] -ScrollX -DisablePaging -AllProperties -Title $Key
                }
            }
        }
    }
} -Online -ShowHTML -FilePath $Env:UserProfile\Desktop\OutputFromFindGPO.html