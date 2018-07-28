# P6-GIRAFServer
Server management for the GIRAF multi-project, including: Kubernetes, Docker and GitLab CI/CD

## GIRAF
The GIRAF application is designed to improve the day-to-day life of people diagnosed with autism. It is created with the help of half the semester groups on the sixth Software semester (around 30 people), resulting in semester where you practise how to work in a professional work environment, working with code you did not write and managing large amounts of people. 

## Server Group
We As the group responsible for the servers, it was our job to keep the servers and their Docker containers alive. To ensure stability, availability, low time to recovery, etc. we worked with:
- Fail2Ban
- Docker
- Kubernetes w. GlusterFS (dynamic provisioning), Flannel (IP leasing), NGINX (one access point), Helm (pod setup)
- GitLab, GitLab CI/CD, GitLab runners on Kubernetes

Files concerning these topics can be found in this repository. The repositories for the GIRAF project can all be found on a self-hosted version of [GitLab](https://gitlab.giraf.cs.aau.dk/).

------------------------------------------------------

Created as part of the 6th semester project of group sw611f18, Comp. Sci, Aalborg University, during spring/summer of 2016.

Group members:
- Andreas Laugård Hald
- Jakob Bo Søndergaard Madsen
- Jonathan Karlsson
- Kim Larsen
- Martin Fabrin Karkov
