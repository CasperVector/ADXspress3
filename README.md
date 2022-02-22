# ADXspress3

An EPICS driver based on [areaDetector](https://github.com/areaDetector) for
[Quantum Detector](http://www.quantumdetectors.com) Xspress3 electronics.

# Run

Change into the `iocXspress3` directory:

    cd /path/to/ADXspress3/iocs
    cd xspress3IOC/iocBoot/iocXspress3

Adapt `st.cmd` as necessary, and note the number of channels `${XSP3CHANS}`.
If the corresponding files, eg. `xsp3-${XSP3CHANS}ch.req`, have not been
generated, generate them now:

    ./xsp3-chan.sh ${XSP3CHANS}

Put the calibration files into the `iocXspress3/cfg-${XSP3CHANS}ch` directory,
and then run the IOC:

    ../../bin/linux-x86_64/xspress3App ./st.cmd

# Compatibility

Backward compatibility for the CARS and QD branches are provided by separate
`iocBoot` subdirectories.  Previous users of them, after putting the calibration
files into locations they previously use, should first change into the `ioc*`
directory they need (see also other directories in `iocBoot`), and then use the
suitable script (adapt as needed) to start the IOC in the mode they want (if
the `iocXsp3QD*` directories are used, the `xspress3App` below must be replaced
with `xspress3AppQD`):

    cd /path/to/ADXspress3/iocs
    cd xspress3IOC/iocBoot/iocXsp3CARS
    ../../bin/linux-x86_64/xspress3App ./4Channel.cmd

Due to the replacement of spectraPlugins by its successor NDPluginAttribute,
any reference to `...:ArrayData_RBV` should be substituted with reference to
the corresponding `...:TSArrayValue` when using the `iocXsp3QD*` directories.
Other features should work like before, as long as the corresponding scripts
are preserved, like `use_allrois.cmd`.  Feel free to report compatibility bugs,
and meanwhile you are also encouraged to try `iocXspress3` directly.

# Manual

See the `documentation` directory.

