
This image can be found in [Dockerhub](https://hub.docker.com/r/satyamsoni2211/maildev).

This image kicks off local `SMTP` server for testing purposes.

Default ports exposed are:

- Web Application: `1080`
- SMTP server: `1025`

You can simply expose ports to access servers locally.

```bash
docker run -it --rm -p 1025:1025 -p 1080:1080 satyamsoni2211/maildev

# output
yarn run v1.22.19
warning package.json: No license field
$ /node_modules/.bin/maildev --smtp= --web=
MailDev using directory /tmp/maildev-31
MailDev webapp running at http://0.0.0.0:1080
MailDev SMTP Server running at 0.0.0.0:1025
Received shutdown signal, shutting down now...
```

You can then access you web server over http://localhost:1080 to check you emails. 

<span><img src="https://raw.githubusercontent.com/maildev/maildev/gh-pages/images/screenshot-2021-01-03.png" height="400" width="100%"/></span>

### Default Port override

ENV variables to override default ports

> `SMTP_PORT`: *Default port for SMTP*
> 
> `SERVER_PORT`: *Default port for Web Server*

You may also need to override the default ports. You may run below command to override:

```bash
docker run -it --rm -e SMTP_PORT=1000 -e SERVER_PORT=8000 -p 1000:1000 -p 8000:8000 satyamsoni2211/maildev
```

This will override SMTP and Web Server ports to 1000 and 8000 as below.

```bash
yarn run v1.22.19
warning package.json: No license field
$ /node_modules/.bin/maildev --smtp=1000 --web=8000
MailDev using directory /tmp/maildev-31
MailDev webapp running at http://0.0.0.0:8000
MailDev SMTP Server running at 0.0.0.0:1000
```

Sample code to test local server:

```py
import smtplib

port = 1025  # For SSL
smtp_server = "localhost"
sender_email = "my@gmail.com"  # Enter your address
receiver_email = "your@gmail.com"  # Enter receiver address
message = """\
Subject: Hi there

This message is sent from Python."""

with smtplib.SMTP(smtp_server, port) as server:
    server.sendmail(sender_email, receiver_email, message)

```