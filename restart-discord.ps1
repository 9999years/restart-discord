[CmdletBinding()]
Param (
	[String]$Name = "Discord"
)

# get discord processes; there's usually about 4 threads
$Procs = Get-Process | Where ProcessName -eq $Name
If($Procs.Length -eq 0) {
	"No processes found named '$Name'"
	exit
}
# find executable path
$Exe = $Procs[0].Path
# OFWGKTA
$Procs | %{ $_.Kill() }
# restart and fork
Start-Process $Exe
