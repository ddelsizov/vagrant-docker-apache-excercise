# Simple apache webserver running on docker container within centos VM

The Vagrantfile describes a simple centos virtualbox VM, which is being provisioned by a simple bash script, which builds and runs a docker container of apache within the VM.

The /web/ folder contains the Dockerfile and index.html, which are being copied on the VM by Vagrant. 
