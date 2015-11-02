This is an atomicapp application based on the nulecule specification. Docker and Kubernetes are the supported providers. You'll need to run this from a workstation that has the [atomic](https://github.com/projectatomic/atomic) command and kubectl client that can connect to a kubernetes master.

It is a single tier application based on jenkins.

### Option 1: Interactive

Run the image. It will automatically use kubernetes as the orchestration provider.  It will prompt for all parameters in the Nulecule file that do not have default values:

    $ [sudo] atomic run projectatomic/jenkins-centos7-atomicapp

## Option 2: Unattended

1. Create the file `answers.conf` with these contents:

    This sets up the values for the configurable parameters and indicates that kubernetes should be the orchestration provider.

        [general]
        namespace = default
        provider = kubernetes

        [jenkins]
        image=kumarpraveen/centos-jenkins:latest
        # port on the node where Jenkins over HTTP will be accessible - valid range 30000-32667
        NODE_PORT=30000


1. Run the application from the current working directory

        $ [sudo] atomic run projectatomic/jenkins-centos7-atomicapp

### Option 3: Install and Run

You may want to download the application, review the configuraton and parameters as specified in the Nulecule file, and edit the answerfile before running the application.

1. Download the application files using `atomic install`

        [sudo] atomic install projectatomic/jenkins-centos7-atomicapp

1. Rename `answers.conf.sample`

        mv answers.conf.sample answers.conf

1. Edit `answers.conf`, review files if desired and then run

        $ [sudo] atomic run projectatomic/jenkins-centos7-atomicapp

Note: You can change the provider to `docker` and the app will be deployed using `docker`.

## Test
Any of these approaches should create kubernetes replication controllers, pods and services.

Jenkins is web app, to test if its functioning we can access it in browser.
We have configured the app on ADB port 30000 (see answer.conf). You can access
the app using the IP of ADB box at port 30000 or by forwarding the port 30000 of ADB box to
host machine port.

To test out if app is running and intialized properly (run following inside ADB)
```
$ kubectl get pods
NAME               READY     STATUS    RESTARTS   AGE
jenkins-0nax4       1/1       Running   0          15m

$ kubectl logs jenkins-0nax4
/usr/lib/python2.7/site-packages/supervisor/options.py:296: UserWarning:
Supervisord is running as root and it is searching for its configuration file in
default locations (including its current working directory); you probably want
to specify a "-c" argument specifying an absolute path to a configuration file
for improved security.
  'Supervisord is running as root and it is searching '
  2015-10-30 12:06:31,194 CRIT Supervisor running as root (no user in config
  file)
  2015-10-30 12:06:31,194 WARN No file matches via include
  "/etc/supervisord.d/*.ini"
  2015-10-30 12:06:31,283 INFO RPC interface 'supervisor' initialized
  2015-10-30 12:06:31,284 CRIT Server 'unix_http_server' running without any
  HTTP authentication checking
  2015-10-30 12:06:31,295 INFO supervisord started with pid 1
  2015-10-30 12:06:32,314 INFO spawned: 'jenkins' with pid 8
  2015-10-30 12:06:33,637 INFO success: jenkins entered RUNNING state, process
  has stayed up for > than 1 seconds (startsecs)
  2015-10-30 12:06:36,798 INFO exited: jenkins (exit status 0; expected)

```

To forward port `30000` of ADB box to host machine port `30000`, add following line your Vagrantfile

```
config.vm.network "forwarded_port", guest: 30000, host: 30000, auto_correct: true

```

and run following command to apply changes in updated Vagrantfile

```
vagrant reload
```

Observe logs as shown above if app is configured and ready to accept connections, once it is ready you should be able to access the app at host browser using address

```
http://127.0.0.1:30000
```
