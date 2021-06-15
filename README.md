# Snmpwalk from Net-SNMP 5.9
*goat 2021-06-15*

This is Alpine 3.13 + net-snmp-tools added with an "snmpwalk" ENTRYPOINT.

Sometimes I find myself wanting to run an snmpwalk from a box that does not have any SNMP tools installed. I find using a container built with snmpwalk as its *ENTRYPOINT* is more convenient than installing the OS packages for SNMP support.

To perform an snmpwalk, fire off something like this:

```
docker run --init -ti goatatwork/snmpwalk:latest -v 1 -c public 192.168.99.1
```

A note on the use of `--init`. I came to use the switch when I realized that I could not *ctrl+c* out of a running snmpwalk process. From [the docs](https://docs.docker.com/engine/reference/run/#specify-an-init-process):

> Specify an init process

> You can use the --init flag to indicate that an init process should be used
> as the PID 1 in the container. Specifying an init process ensures the usual
> responsibilities of an init system, such as reaping zombie processes, are
> performed inside the created container.

>The default init process used is the first docker-init executable found in the
> system path of the Docker daemon process. This docker-init binary, included
> in the default installation, is backed by [tini](https://github.com/krallin/tini).
