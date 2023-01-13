< envPaths
errlogInit(20000)

# PREFIX
epicsEnvSet("PREFIX", "XSP3_1Chan:")

# Number of xspress3 channels
epicsEnvSet("NUM_CHANNELS",  "1")            

# Number of xspress3 cards and IP ADDR
epicsEnvSet("XSP3CARDS", "1")
epicsEnvSet("XSP3ADDR",  "192.168.0.1")

# Max Number of Frames for data collection
epicsEnvSet("MAXFRAMES", "16384")
epicsEnvSet("MAXDRIVERFRAMES", "16384")

# Number of Energy bins
epicsEnvSet("NUM_BINS",  "4096")

< DefineXSP3Driver.cmd

###############################
# DEFINE CHANNELS
#Channel 1
epicsEnvSet("CHAN",   "1")
epicsEnvSet("CHM1",   "0")
< DefineSCAROI.cmd
###############################

dbLoadRecords("xspress3Deadtime_1Channel.template",   "P=$(PREFIX)")

< AutoSave.cmd

###############################
# start IOC
iocInit

# setup startup values

#Configure and connect to Xspress3
dbpf("$(PREFIX)det1:CONFIG_PATH", "/home/xspress3/xspress3_settings/current/")

< SetMainValues.cmd
dbpf("$(PREFIX)det1:NDAttributesFile", "XSP3-1Channel.xml")

###############################
# SET UP CHANNELS
#Channel 1
epicsEnvSet("CHAN",   "1")
epicsEnvSet("CHM1",   "0")
< SetChannelValues.cmd
###############################

# save settings every thirty seconds
create_monitor_set("1Channel-settings.req",30,"P=$(PREFIX)")

epicsThreadSleep(5.)

# Set default event widths for deadtime correction
# note: these may be tuned for each detector:
# dbpf("$(PREFIX)C1:EventWidth",    "6")

# Xspress3 is now ready to use!
