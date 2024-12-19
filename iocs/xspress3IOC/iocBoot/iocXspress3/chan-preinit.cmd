NDROIConfigure("ROI$(CHAN)", $(QSIZE), 0, "$(PORT)", 0, 0, 0, 0, 0, 1)
NDStdArraysConfigure("MCA$(CHAN)", 20, 0, "ROI$(CHAN)", 0, 0, 0, 0, 0, 5)
NDROIConfigure("ROISUM$(CHAN)", $(QSIZE), 0, "PROC1", 0, 0, 0, 0, 0, 1)
NDStdArraysConfigure("MCASUM$(CHAN)", 20, 0, "ROISUM$(CHAN)", 0, 0, 0, 0, 0, 5)
NDAttrConfigure("ATTR$(CHAN)", $(QSIZE), 0, "$(PORT)", 0, 10)
NDTimeSeriesConfigure("ATTR$(CHAN)_TS", $(QSIZE), 0, "ATTR$(CHAN)", 1, 10)
NDROIStatConfigure("ROISTAT$(CHAN)", $(QSIZE), 0, "ROI$(CHAN)", 0, 16, 0, 0, 0, 0, 1)
dbLoadTemplate("$(TOP)/iocBoot/$(IOC)/xsp3-chan.substitutions", "P=$(PREFIX),PORT=$(PORT),PORT_=$(PORT),ADDR=$(ADDR),MAXFRAMES=$(MAXFRAMES),NUMBINS=$(NUMBINS),CHAN=$(CHAN)")

