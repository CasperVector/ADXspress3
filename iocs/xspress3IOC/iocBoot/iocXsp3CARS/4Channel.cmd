< envPaths
errlogInit(20000)

# PREFIX
epicsEnvSet("PREFIX", "XSP3_4Chan:")

# Number of xspress3 channels
epicsEnvSet("NUM_CHANNELS",  "4")            

# Number of xspress3 cards and IP ADDR
epicsEnvSet("XSP3CARDS", "1")
epicsEnvSet("XSP3ADDR",  "192.168.0.1")

# Max Number of Frames for data collection
# Use CIRC_BUFFER as 1 for more than 12216 frames
epicsEnvSet("CIRC_BUFFER", "1")
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

#Channel 2
epicsEnvSet("CHAN",   "2")
epicsEnvSet("CHM1",   "1")
< DefineSCAROI.cmd

#Channel 3
epicsEnvSet("CHAN",   "3")
epicsEnvSet("CHM1",   "2")
< DefineSCAROI.cmd

#Channel 4
epicsEnvSet("CHAN",   "4")
epicsEnvSet("CHM1",   "3")
< DefineSCAROI.cmd

###############################

dbLoadRecords("xspress3Deadtime_4Channel.template",   "P=$(PREFIX)")

< AutoSave.cmd

###############################
# start IOC
iocInit

# setup startup values

# Configure Xspress3:
# The "CONFIG_PATH" value points to the calibration folder with files:
#     card0_clocks.dat, chan1_reion0.dat, etc
# dbpf("$(PREFIX)det1:CONFIG_PATH", "/etc/xspress3/calibration/initial")
dbpf("$(PREFIX)det1:CONFIG_PATH", "$(SUPPORT)/../xspress3_settings/current/")

< SetMainValues.cmd
dbpf("$(PREFIX)det1:NDAttributesFile", "XSP3-4Channel.xml")

###############################
# SET UP CHANNELS
#Channel 1
epicsEnvSet("CHAN",   "1")
epicsEnvSet("CHM1",   "0")
< SetChannelValues.cmd

#Channel 2
epicsEnvSet("CHAN",   "2")
epicsEnvSet("CHM1",   "1")
< SetChannelValues.cmd

#Channel 3
epicsEnvSet("CHAN",   "3")
epicsEnvSet("CHM1",   "2")
< SetChannelValues.cmd

#Channel 4
epicsEnvSet("CHAN",   "4")
epicsEnvSet("CHM1",   "3")
< SetChannelValues.cmd
###############################

# save settings every thirty seconds
create_monitor_set("4Channel-settings.req",30,"P=$(PREFIX)")

epicsThreadSleep(5.)

# Set default event widths for deadtime correction
# note: these may be tuned for each detector:
# dbpf("$(PREFIX)C1:EventWidth",    "6")
# dbpf("$(PREFIX)C2:EventWidth",    "6")
# dbpf("$(PREFIX)C3:EventWidth",    "6")
# dbpf("$(PREFIX)C4:EventWidth",    "6")

# Xspress3 is now ready to use!
