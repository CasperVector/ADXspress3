TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install)
# databases, templates, substitutions like this

DB += xspress3_QD.template
DB += xspress3Channel.template
DB += xspress3ChannelSCALimits.template
DB += xspress3ChannelSCAThreshold.template
DB += xspress3ChannelMCAROI.template
DB += xspress3_highlevel.template
DB += xspress3_AttrReset_QD.template
DB += xspress3_AttrUpdate.template
DB += xspress3_pluginControl.template
DB += xspress3Deadtime.template

DB += xsp3.template
DB += xsp3_chan.template
DB += xsp3_chan_scaparam.template
DB += xsp3_chan.db
REQ += xsp3.req
REQ += xsp3_chan.req

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

