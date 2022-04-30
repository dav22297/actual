#actual

Actual is now open source: https://github.com/actualbudget/actual .
This is a simple docker container to host your own actual server.

```
version: '3.5'

services:
    actual:
        container_name: actual
        image: phoenixashes/actual
        ports: 
            - 5006:5006
        volumes:
            - server_data:/usr/bin/actual-server/server-files     # persistant server data
            - user_data:/usr/bin/actual-server/user-files     # persistant user data

volumes:
    server_data:
    user_data:
```
