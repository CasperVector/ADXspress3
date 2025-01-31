< envPaths
errlogInit(20000)
callbackSetQueueSize(8000)

dbLoadDatabase "$(TOP)/dbd/xspress3App.dbd"
xspress3App_registerRecordDeviceDriver(pdbbase)

epicsEnvSet("PREFIX", "13XSP3:")
epicsEnvSet("XSP3ADDR", "192.168.0.1")
epicsEnvSet("XSP3CARDS", "2")
epicsEnvSet("XSP3CHANS", "4")
epicsEnvSet("CIRC_BUFFER", "1")
epicsEnvSet("MANUALSOFTSTART", "1")
epicsEnvSet("MAXFRAMES", "16384")
epicsEnvSet("MAXDRIVERFRAMES", "16384")
epicsEnvSet("NUMBINS", "4096")
epicsEnvSet("QSIZE", "256")
epicsEnvSet("PORT", "XSP3")
epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(ADCORE)/db:$(ADXSPRESS3)/db")

xspress3Config("$(PORT)", "$(XSP3CHANS)", "$(XSP3CARDS)", "$(XSP3ADDR)", "$(MAXFRAMES)", "$(MAXDRIVERFRAMES)", "$(NUMBINS)", 0, 0, 0, 0, "$(CIRC_BUFFER)", "$(MANUALSOFTSTART)")
dbLoadRecords("xsp3.template", "P=$(PREFIX),R=cam1:,PORT=$(PORT),ADDR=0,TIMEOUT=1")
NDFileHDF5Configure("FileHDF1", $(QSIZE), 0, "$(PORT)", 0, 0)
dbLoadRecords("NDFileHDF5.template", "P=$(PREFIX),R=HDF1:,PORT=FileHDF1,ADDR=0,TIMEOUT=1,XMLSIZE=2048,NDARRAY_PORT=$(PORT)")
NDProcessConfigure("PROC1", $(QSIZE), 0, "$(PORT)", 0, 0, 0)
dbLoadRecords("NDProcess.template", "P=$(PREFIX),R=Proc1:,PORT=PROC1,ADDR=0,TIMEOUT=1,NDARRAY_PORT=$(PORT)")
dbLoadRecords("xsp3_plugins.template", "P=$(PREFIX),R=cam1:,PROC=Proc1:")

set_requestfile_path("./")
set_requestfile_path("$(ADCORE)/db")
set_requestfile_path("$(ADXSPRESS3)/db")
set_savefile_path("./autosave")
set_pass0_restoreFile("auto_settings.sav")
set_pass1_restoreFile("auto_settings.sav")
save_restoreSet_status_prefix("$(PREFIX)")
dbLoadRecords("$(AUTOSAVE)/db/save_restoreStatus.db", "P=$(PREFIX)")

cd "$(TOP)/iocBoot/$(IOC)"
iocshLoad("xsp3-$(XSP3CHANS)ch-batch.cmd", "TASK=preinit")
iocInit()
#create_monitor_set("xsp3-$(XSP3CHANS)ch.req", 30, "P=$(PREFIX)")
dbpf("$(PREFIX)cam1:CONFIG_PATH", "cfg-$(XSP3CHANS)ch")
dbpf("$(PREFIX)cam1:NDAttributesFile", "xsp3-$(XSP3CHANS)ch.xml")
dbpf("$(PREFIX)Proc1:EnableFilter", "Enable")
dbpf("$(PREFIX)Proc1:FilterType", "Sum")
dbpf("$(PREFIX)Proc1:EnableCallbacks", "Enable")
iocshLoad("xsp3-$(XSP3CHANS)ch-batch.cmd", "TASK=postinit")
dbpf("$(PREFIX)cam1:ArrayCallbacks", 1)

dbpf("$(PREFIX)cam1:CONNECT", 1)
dbpf("$(PREFIX)cam1:CTRL_DTC", "Disable")
dbpf("$(PREFIX)cam1:EraseOnStart", "Yes")
dbpf("$(PREFIX)cam1:TriggerMode", "Internal")
dbpf("$(PREFIX)cam1:AcquireTime", 0.02)
dbpf("$(PREFIX)cam1:NumImages", 100)
epicsThreadSleep 2

