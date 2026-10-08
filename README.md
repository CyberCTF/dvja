# Damn Vulnerable Java Application

[DVJA](https://github.com/appsecco/dvja) by Abhisek Datta (Appsecco): a deliberately vulnerable
Java web application (Struts 2, Spring, Hibernate, MySQL) with one section per OWASP Top 10
(2013) risk. This repository runs it with [Isoloom](https://www.isoloom.com):
[`isoloom.yml`](isoloom.yml) describes the machines, and the upstream source in
[`build/web/app/`](build/web/app) builds with its own Dockerfile (on a current Java 8 base,
credentials baked in).

| Machine | Service |
| --- | --- |
| app | DVJA (Jetty) on port 8080 |
| mysql | MySQL 5.5 on port 3306 |

The application creates its schema in MySQL when it starts; register an account to begin.

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:8080/. The same spec runs as Docker on a local VM (`docker-vm`), on a
cloud VM (`cloud-docker`) or on Kubernetes. Lab guide: the assessment
and solution chapters in [`build/web/app/docs/`](build/web/app/docs).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

MIT, as DVJA ([LICENSE](LICENSE)). This application is deliberately vulnerable: keep it isolated.
