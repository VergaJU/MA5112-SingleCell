# MA5112-SingleCell


This is a short guide to setup the environment to run the scRNA-Seq practical for the course MA5112.
Almost all the files needed are in this directory, you have only to add a list of users with relative password and email in this format:

```
user1 password1 email1@domain.com
```

If the file is called `ids.txt` you don't have to change any argument n the scripts and Dockerfile.

## Environment

I worked in a CloudCix VM with Ubuntu server 20.04 installed, so all the steps will consider a similar environment, adapt it to your infrastructure.

### Create a VM

The practical requires at most 4GB of memory to run so you can consider to create a VM with $(4 * N_{students})$ GB of memory. 
The hard drive need few Gb for the container and the files:
- 5.88GB of container
- 13MB for the sample files
- 61MB for the reference

### Install docker

OS images in CloudCix are quite naive versions, here are the scripts I used to insall docker:

```
sudo apt-get update
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

```

### Users

running the script `create_users.sh` you will be able to automatically create all the users from the `ids.txt` file, copy `practical.Rmd` in their folder and customize it adding their email address.

All the users will have read, write and execute permissions, only in their folder in order to don't be able to copy the files from other users.
```
drwx------
```

### Files

The directory `files/` and `reference/` contains all the files needed to run the practical, ensure all the users have read and execute permissions in order to load the files in the R session.
```
dr-xr-xr-x
```

## Rstudio server

Once all the previous steps are ready you can start the server simply running:
```
sudo docker compose up -d
```

It will create the image from the Dockerfile and run the container. The container will include all the users accounts, so the `ids.txt` file has to be in the same folder with the `Dockerfile` and `compose.yml` for privacy reasons I suggest to keep all these data in an admin folder that none of the students can access.

## Access the server

Now, going to the public IP of the VM (or other machine), you will be able to login into the Rstudio session using the credentials provided.

Follow the instructions of [instructions.pdf](./instructions/week4_scRNASeq.pdf) and [practical.Rmd](./practical.Rmd) to complete the practical.