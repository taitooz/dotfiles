#!/usr/bin/env python

import json
import urllib2
total=0
for i in [0,1,2]:
	clients = json.load(urllib2.urlopen("http://caronte-0"+ str(i) +":9290/v3/caronte/client-status"))
	system = json.load(urllib2.urlopen("http://caronte-0"+ str(i) +":9290/v3/caronte/system-status"))
	print "CARONTE-0" + str(i) + " -> " + json.dumps(clients, sort_keys=True, indent=4, separators=(',', ': ')) + "\n--"
	print json.dumps(system, sort_keys=True, indent=4, separators=(',', ': ')) + "\n"
	print "################################\n"
	total = total + int(json.dumps(system['emails_in_total']))
print "TOTAL = " + str(total)
