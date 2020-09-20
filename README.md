![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/akito13/spacedeck?style=plastic)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/akito13/spacedeck?style=plastic)

![Docker Stars](https://img.shields.io/docker/stars/akito13/spacedeck?style=plastic)
![Docker Pulls](https://img.shields.io/docker/pulls/akito13/spacedeck?style=plastic)

![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/akito13/spacedeck?style=plastic)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/akito13/spacedeck?style=plastic)

[![Upstream](https://img.shields.io/badge/upstream-project-yellow?style=plastic)](https://github.com/spacedeck/spacedeck-open)

![GitHub](https://img.shields.io/github/license/theAkito/docker-spacedeck?style=plastic)
![Liberapay patrons](https://img.shields.io/liberapay/patrons/Akito?style=plastic)

## What
Spacedeck Docker image.

## Why
Promoted `bash` to shell first class.

## How
After updating the paths in the `docker-compose.yml` file and adjusting the config in `config/default.json`, before putting it in the correct `config/` directory:
```bash
docker-compose up -d
```

## Get
Latest build:
```bash
docker pull akito13/spacedeck
```
Fixed version:
```bash
docker pull akito13/spacedeck:0.1.0
```
Tags follow semver, without the `v`.
Git tags equal Docker tags, so no need to check tags explicitly on Docker Hub.

## Build
Build yourself:
```bash
bash docker-build.sh
```

## License
Copyright (C) 2020  Akito <the@akito.ooo>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.