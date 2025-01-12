FROM postgres:16
RUN apt update && apt install postgis* postgresql-16-postgis postgresql-client-16 -y
