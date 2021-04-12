# Phoenix CodeReloader doesn't reload code for different instances of the same app running simultaneously

This is a demo app that demostrates a bug in Phoenix CodeReloader.

If 2 or more running instances of the app share the same `_build` folder, Phoenix CodeReloader doesn't work properly. It recompiles and reloads code after changes only for the app that first receive an http request (the one that first hits CodeReloader's plug). Since `_build` dir is shared, the code for the second instance is also recompiled but it never gets reloaded due to the current (April 13, 2021) implementation of Phoenix.CodeReloader.Server.


Setup app in containers and starts the app in current shell in not detached mode:
```
bin/start
```

Please don't change any code before running the test:
```
bin/test
```

Remove containers, volumes, and network, created by `bin/setup`:
```
bin/clean
```

If you want to launch iex attached to cluster, run `bin/repl`.

In iex you may find a list of nodes `Node.list()` and run iex attached to particular node: `bin/repl --remsh app@71fa7f64e6f6`.


If you use VSCode, you can attach to running container in order to see _build dir:

Open a vscode and in command palette (cmd + shift + p) select "Remote-Containers: Attach to Running Container..." and select the name of the container with the app.
