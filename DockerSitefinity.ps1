docker pull microsoft/aspnet:4.7.1-windowsservercore-ltsc2016
docker build -t sfImage -m 3GB .
docker run -d -p 8000:80 -m 3GB --name sfImage sfContainer1
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" sfContainer1