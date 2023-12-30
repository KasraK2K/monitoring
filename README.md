# MONITORING

NOTE: `cadvisor` just can work in linux OS

## Grafana

Check grafana container logs:
```bash
docker logs grafana
```
<br />

Check the health of the Grafana container using the following command:
```bash
docker inspect --format='{{json .State.Health}}' grafana
```
<br />

Inside the Grafana container, you can check the logs for any errors or issues:
```bash
docker exec -it grafana /bin/bash
cat /var/log/grafana/grafana.log
```
<br />

Check the current permissions of the /var/lib/grafana and /var/lib/grafana/plugins directories on your host machine. Use the following command:
```bash
ls -ld /var/lib/grafana /var/lib/grafana/plugins
```
<br />

If needed, you can adjust the permissions of the directories. For example, if the user running the Grafana container is `root`, you can set the ownership of the directories:
```bash
sudo chown -R root:root /var/lib/grafana /var/lib/grafana/plugins
```
<br />

After adjusting permissions, restart the Grafana container:
```bash
docker restart grafana
```
<br />

## Prometheus

Check `prometheus` container logs:
```bash
docker logs prometheus
```
<br />

Update the ownership of the `/prometheus` directory based on the user and group identified in the previous step. For example, if the output is 1000:1000, you would run:
```bash
sudo chown -R 65534:65534 /prometheus
```
<br />

After adjusting permissions, restart the Prometheus container:
```bash
docker restart prometheus
```

Review the Prometheus container logs again to see if the permission issue is resolved:
```bash
docker logs prometheus
```

