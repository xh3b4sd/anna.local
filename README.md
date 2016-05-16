# anna.local
This project represents the local environment for
https://github.com/xh3b4sd/anna. It is bootstrapped using
[Vagrant](https://www.vagrantup.com/) and
[Virtualbox](https://www.virtualbox.org/). **Note that this project is new and
WIP**

### setup
Besides installing Vagrant and Virtualbox you need one additional Vagrant
plugin. This is used to modify your local `/etc/hosts` to make beautiful
hostnames working.
```
vagrant plugin install vagrant-hostsupdater
```

### usage
The whole environment can simply be brought up using the following command.
You will be asked to provide your password due to authorization for modifying
your local `/etc/hosts`. You can either skip that and add the required
hostnames manually to your hosts file, or let the vagrant plugin do its job.
```
vagrant up
```

### anna address
```
http://anna.anna.local
```

### grafana dashboard
```
http://grafana.anna.local
```

### prometheus dashboard
```
http://prometheus.anna.local
```

### traefik dashboard
```
http://traefik.anna.local
```
