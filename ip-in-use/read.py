#!/usr/bin/python env


with open('ips.txt', 'r') as f:
    data = f.readlines()
data = data[:len(data)-1]
ips = []
status = []
# removing uneccessary spaces
for i in range(0, len(data)):
    data[i] = data[i].lstrip(' ')
    data[i] = data[i].rstrip('\n') 
    splitted = data[i].split("|")
    ips.append(splitted[0])
    status.append(splitted[1])
    
#compList =  {}
#for x in range(0, len(ips)):
#    compList[ips[x]] = status[x]
   
#print(compList)
#ipString = ['<th' + x for x in data]

#ul = "<ul>"
#for ip in ipString:
#   ul += ip
#ul += "</ul>"
#print(ul)

#ipString = ipString[:len(ipString) - 1]
table = "<table>"
for i in range(0, len(ips)):
    table += "<tr>"
    table += f"<td>{ips[i]}</td>"
    table += f'<td>{status[i]}</td>'
    table += "</tr>"
table += "</table>"

htmlStart = f"""
<!DOCTYPE html> 
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>IP Addresses In Use</title>

        <style>
            table, th, td {{
              border: 1px solid black;
            }}
        </style>
      </head>
      
      <body>
            {table}
      </body>
      </html>
"""

with open('index.html', 'w') as f:
    f.write(htmlStart)

