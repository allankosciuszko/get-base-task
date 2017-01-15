# Get base task


### Requirements:
- docker > 1.9.1
- docker-compose 
- make

### Boot:
```
 make setup
```

### Running tests:
```
 make test
```

### Reports
Then reports should be ***./results/reports*** directory.

### Clean up
```
 make clean 
```
This removes all running docker stuff.

### VNC access 
You can access selenium container via VNC  during test execution via 127.0.0.1:5900 address.

### Running on OSX
- make sure you have port forwarding rules set in VirtualBox  Network Settings:
 4444 -> 4444, 5900 -> 5900 

