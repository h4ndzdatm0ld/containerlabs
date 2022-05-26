# A collection of [ContainerLab](https://containerlab.srlinux.dev/) topologies

## Requirements

A working installation of Docker and Docker-Compose

## Nested Virtualization

Qemu based nodes that have been containerized with `vrnetlab` for `Containerlab`, which require the ability to run nested virtualization.

## Lab Definitions

The collection of topology definitions will be mounted into the `clab` container. Currently it's defaulted to run a specific lab topology, but it's simple to override the command and define a new topology.

## Running Labs

First, define the lab topology inside of the `/lab-definitions` directory.

Using Docker-Compose override the `command` and bring up a custom lab of your choice

```bash
docker-compose run clab containerlab deploy -t lab-definitions/xrv9k-sros.yml
```

Currently the default lab of `4x-sros.yml` is defaulted inside of the `clab` service

```bash
docker-compose run clab
Creating container-lab-sra_clab_run ... done
INFO[0000] Containerlab v0.25.1 started
INFO[0000] Parsing & checking topology file: 4x-sros.yml
INFO[0000] Creating lab directory: /src/clab-4x-sros.yml
INFO[0000] Creating docker network: Name="containerlab-mgmt", IPv4Subnet="172.100.210.0/24", IPv6Subnet="2001:172:100:210::/80", MTU="1500"
INFO[0000] Creating container: "sros-r1"
INFO[0000] Creating container: "sros-r2"
INFO[0000] Creating container: "sros-r3"
INFO[0000] Creating container: "sros-r4"
INFO[0001] Creating virtual wire: sros-r3:eth2 <--> sros-r4:eth1
INFO[0001] Creating virtual wire: sros-r4:eth2 <--> sros-r2:eth2
INFO[0001] Creating virtual wire: sros-r1:eth2 <--> sros-r3:eth1
INFO[0001] Creating virtual wire: sros-r1:eth1 <--> sros-r2:eth1
INFO[0002] Adding containerlab host entries to /etc/hosts file
+---+--------------------------+--------------+---------------------------+---------+---------+-------------------+-------------------------+
| # |           Name           | Container ID |           Image           |  Kind   |  State  |   IPv4 Address    |      IPv6 Address       |
+---+--------------------------+--------------+---------------------------+---------+---------+-------------------+-------------------------+
| 1 | clab-4x-sros.yml-sros-r1 | 7288da449fb7 | h4ndzdatm0ld/sros:21.2.R1 | vr-sros | running | 172.100.210.10/24 | 2001:172:100:210::10/80 |
| 2 | clab-4x-sros.yml-sros-r2 | c0465b41f34f | h4ndzdatm0ld/sros:21.2.R1 | vr-sros | running | 172.100.210.20/24 | 2001:172:100:210::20/80 |
| 3 | clab-4x-sros.yml-sros-r3 | 518464c30092 | h4ndzdatm0ld/sros:21.2.R1 | vr-sros | running | 172.100.210.30/24 | 2001:172:100:210::30/80 |
| 4 | clab-4x-sros.yml-sros-r4 | 7774242ebbab | h4ndzdatm0ld/sros:21.2.R1 | vr-sros | running | 172.100.210.40/24 | 2001:172:100:210::40/80 |
+---+--------------------------+--------------+---------------------------+---------+---------+-------------------+-------------------------+
```

## Accessing Devices

For Nokia devices the user/pass is `admin:admin`.

For CSR/XR the user/pass is `clab:clab@123`.

After running a lab, you can either ssh into via the statically assigned IP in the lab definition YAML file or by it's container name.

## Average Resource Stats

Output of `docker stats` when running 4 SROS containers

```bash
CONTAINER ID   NAME                       CPU %     MEM USAGE / LIMIT     MEM %     NET I/O           BLOCK I/O    PIDS
c5903aec0c5b   clab-4x-sros.yml-sros-r3   8.15%     2.226GiB / 62.71GiB   3.55%     9.33kB / 1.02kB   0B / 568MB   7
ab4bad5fbbdc   clab-4x-sros.yml-sros-r2   8.05%     2.24GiB / 62.71GiB    3.57%     77.6kB / 141kB    0B / 568MB   7
5f236e06aca9   clab-4x-sros.yml-sros-r4   6.74%     2.226GiB / 62.71GiB   3.55%     7.83kB / 1.02kB   0B / 568MB   7
baabb625800d   clab-4x-sros.yml-sros-r1   8.27%     2.236GiB / 62.71GiB   3.57%     54.6kB / 112kB    0B / 568MB   7
```

## Destroy Labs

To gracefully destroy labs use the `destroy` command

```bash
docker-compose run clab containerlab destroy -t lab-definitions/xrv9k-sros.yml
```

```bash
➜  container-lab-sra git:(main) ✗ docker-compose run clab containerlab destroy -t lab-definitions/xrv9k-sros.yaml
Creating container-lab-sra_clab_run ... done
INFO[0000] Parsing & checking topology file: xrv9k-sros-lab.yaml
INFO[0000] Destroying lab: xrv9k-lab
INFO[0000] Removed container: clab-xrv9k-lab-xrv-1
INFO[0001] Removed container: clab-xrv9k-lab-xrv-2
INFO[0001] Removing containerlab host entries from /etc/hosts file
```# containerlabs
