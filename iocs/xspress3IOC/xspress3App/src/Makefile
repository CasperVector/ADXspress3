TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

PROD_NAME = xspress3App
ifeq (linux-x86_64, $(findstring linux-x86_64, $(T_A)))
  PROD_IOC_Linux  += xspress3App
  PROD_IOC_Linux  += xspress3AppQD
endif

# <name>.dbd will be created from <name>Include.dbd
DBD += $(PROD_NAME).dbd
$(PROD_NAME)_DBD += xspress3Support.dbd

# <name>_registerRecordDeviceDriver.cpp will be created from <name>.dbd
xspress3App_SRCS += xspress3App_registerRecordDeviceDriver.cpp xspress3AppMain.cpp
xspress3AppQD_SRCS += xspress3App_registerRecordDeviceDriver.cpp xspress3AppMain.cpp

xspress3App_LIBS += xspress3Epics
xspress3AppQD_LIBS += xspress3EpicsQD
PROD_LIBS += xspress3
PROD_LIBS += img_mod
PROD_SYS_LIBS += pthread rt

include $(ADCORE)/ADApp/commonDriverMakefile

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

