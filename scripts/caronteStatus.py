#!/usr/bin/env python

from decimal import Decimal
import json
import urllib2
total = 0
avg = 0
rpm = 0
coned = 0
for i in [0, 1, 4, 5]:
    clients = json.load(urllib2.urlopen("http://caronte-0"+ str(i) +":9290/v3/caronte/client-status"))
    system = json.load(urllib2.urlopen("http://caronte-0"+ str(i) +":9290/v3/caronte/system-status"))
    print "\033[95m--------------------------------\n"
    print "\033[92mCARONTE-0" + str(i) + " -> " + json.dumps(clients, sort_keys=True, indent=4, separators=(',', ': ')) + "\n--"
    print json.dumps(system, sort_keys=True, indent=4, separators=(',', ': ')) + "\n"
    total += int(json.dumps(system['emails_in_total']))
    avg = Decimal(avg) + Decimal(json.dumps(system['avg_sent_time']).replace("sec","").strip(' "'))
    rpm += int(json.dumps(system['sents_in_the_last_minute']))
    coned += int(json.dumps(system['people_coned']))
print "\033[95m################################\n"
print "\033[1mTOTAL = " + str(total)
print "AVG_TIME = " + str(round(avg, 2)/int(3)) + " ms"
print "RPM = " + str(rpm)
print "CONED = " + str(coned)
