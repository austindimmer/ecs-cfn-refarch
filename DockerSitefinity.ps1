cd C:\eMakina\Dev\SitefinityHardenedCore\website\Emakina.Sitefinity.WebApp

docker pull microsoft/aspnet:4.7.1-windowsservercore-ltsc2016
docker build -t sfImage -m 3GB .
docker run -d -p 8000:80 -m 3GB --name sfImage sfContainer1
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" sfContainer1

aws ecr get-login --no-include-email --region eu-west-1

# 2) Run the docker login command that was returned in the previous step. 
# Note: 
# If you are using Windows PowerShell, run the following command instead.
Invoke-Expression -Command (aws ecr get-login --no-include-email --region eu-west-1 --profile WebSiteFactory)

# 3) Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here. You can skip this step if your image is already built:
docker build -t sfimage -m 3GB .
docker run -d -p 8000:80 -m 3GB --name sfimage sfcontainer1
docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" sfcontainer1

# 4) After the build completes, tag your image so you can push the image to this repository:
docker tag sfimage:latest 871989493406.dkr.ecr.eu-west-1.amazonaws.com/sfimage:latest

# 5) Run the following command to push this image to your newly created AWS repository:
docker push 871989493406.dkr.ecr.eu-west-1.amazonaws.com/sfimage:latest

docker ps -a

docker start aspnetcontainer

docker stop aspnetcontainer

docker stop dockercompose9599444262858790027_awsecssample_1

docker rm aspnetcontainer

docker rm dockercompose9599444262858790027_awsecssample_1

docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" aspnetcontainer

docker images