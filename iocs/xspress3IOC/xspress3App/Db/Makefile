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

DB += xspress3Deadtime_1Channel.template
DB += xspress3Deadtime_2Channel.template
DB += xspress3Deadtime_4Channel.template
DB += xspress3Deadtime_7Channel.template
DB += xspress3Deadtime_8Channel.template
DB += xspress3Deadtime_14Channel.template
DB += xspress3Deadtime_16Channel.template

DB += example.db
DB += 1Channel.db
DB += 2Channel.db
DB += 4Channel.db
DB += 6Channel.db
DB += 7Channel.db
DB += 8Channel.db
DB += 16Channel.db
DB += 32Channel.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

