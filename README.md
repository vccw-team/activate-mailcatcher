# Activate MailCather for VCCW

## How to use

Download latest version of the VCCW.

http://vccw.cc/

Provision.

```
$ vagrant up
```

SSH into your virtual machine.

```
$ vagrant ssh
```

Run following command on your virtual machine.

```
$ curl -L https://raw.githubusercontent.com/vccw-team/activate-mailcatcher/master/setup.sh | bash
```

Visit `http://<ip-address>:1080/`.

![MailCatcher](https://www.evernote.com/l/ABUQnz2NjfhHEKGuKr7m7KyRwsU03mjMlZoB/image.png)
