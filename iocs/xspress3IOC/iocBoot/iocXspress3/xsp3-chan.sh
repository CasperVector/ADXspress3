#!/bin/sh -

[ "$1" -gt 0 ] || exit 1

exec > xsp3-"$1"ch-batch.cmd
for i in $(seq "$1"); do
	printf 'iocshLoad("$(TOP)/iocBoot/$(IOC)/chan-$(TASK).cmd",'
	printf ' "CHAN=%d,ADDR=%d")\n' "$i" "$(expr "$i" - 1)"
done
printf '\n'

exec > xsp3-"$1"ch.req
printf 'file "xsp3.req", P=$(P)\n'
for i in $(seq "$1"); do
	printf 'file "xsp3_chan.req", P=$(P), CHAN=%d\n' "$i"
done
printf '\n'

