$source = (
("Microsoft Visual C++ 2005 SP1 Redistributable Package (x86)",	   "https://download.microsoft.com/download/e/1/c/e1c773de-73ba-494a-a5ba-f24906ecf088/vcredist_x86.exe",	 "vcredist\2005\vcredist_x86.exe"),
("Microsoft Visual C++ 2005 SP1 Redistributable Package (x64)",	   "https://download.microsoft.com/download/d/4/1/d41aca8a-faa5-49a7-a5f2-ea0aa4587da0/vcredist_x64.exe",	 "vcredist\2005\vcredist_x64.exe"),
("Microsoft Visual C++ 2008 SP1 Redistributable Package (x86)",	   "https://download.microsoft.com/download/d/d/9/dd9a82d0-52ef-40db-8dab-795376989c03/vcredist_x86.exe",	 "vcredist\2008\vcredist_x86.exe"),
("Microsoft Visual C++ 2008 SP1 Redistributable Package (x64)",	   "https://download.microsoft.com/download/2/d/6/2d61c766-107b-409d-8fba-c39e61ca08e8/vcredist_x64.exe",	 "vcredist\2008\vcredist_x64.exe"),
("Microsoft Visual C++ 2010 SP1 Redistributable Package (x86)",	   "https://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe",	 "vcredist\2010\vcredist_x86.exe"),
("Microsoft Visual C++ 2010 SP1 Redistributable Package (x64)",	   "https://download.microsoft.com/download/A/8/0/A80747C3-41BD-45DF-B505-E9710D2744E0/vcredist_x64.exe",	 "vcredist\2010\vcredist_x64.exe"),
("Microsoft Visual C++ 2012 Update 4 Redistributable Package (x86)","http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU4/vcredist_x86.exe",	 "vcredist\2012\vcredist_x86.exe"),
("Microsoft Visual C++ 2012 Update 4 Redistributable Package (x64)","http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU4/vcredist_x64.exe",	 "vcredist\2012\vcredist_x64.exe"),
("Microsoft Visual C++ 2013 Redistributable Package (x86)",		   "http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe",		 "vcredist\2013\vcredist_x86.exe"),
("Microsoft Visual C++ 2013 Redistributable Package (x64)",		   "http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe",		 "vcredist\2013\vcredist_x64.exe"),
("Microsoft Visual C++ 2015 Redistributable Package (x86)",		   "https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x86.exe",	 "vcredist\2015\vc_redist.x86.exe"),
("Microsoft Visual C++ 2015 Redistributable Package (x64)",		   "https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe",	 "vcredist\2015\vc_redist.x64.exe"),
("Microsoft Visual C++ 2017 Redistributable Package (x86)",		   "https://aka.ms/vs/15/release/vc_redist.x86.exe",												 "vcredist\2017\vc_redist.x86.exe"),
("Microsoft Visual C++ 2017 Redistributable Package (x64)",		   "https://aka.ms/vs/15/release/vc_redist.x64.exe",												 "vcredist\2017\vc_redist.x64.exe")
)

foreach ($item in $source)
{
    $title = $item[0]
    $source = $item[1]
    $target = $item[2]

    $output = "$PSScriptRoot\VCRedistInstaller\$target"

    if(![System.IO.File]::Exists($output)){
	   $start_time = Get-Date

	   (New-Object System.IO.FileInfo $output).Directory.Create()
	   Write-Output "Downloading $title..."

	   $client = new-object System.Net.WebClient
	   $client.DownloadFile($source,$output)

	   Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
    }
}