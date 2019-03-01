# Heap Gateway

Ansible playbook to setup SSH gateway to [heap
cluster](https://www.recurse.com/blog/126-heap-sponsors-rc-community-cluster) at
[RC](https://recurse.com).

## Using the HEAP Gateway
If you don't have access to heap machines already, this is not going to give you magical access :-)

Easiest way is to append following snippet to your `$HOME/.ssh/config` file

```
Host spring
	Hostname heapgw.dbalan.in
	Port 2201
	
Host broome
	Hostname heapgw.dbalan.in
	Port 2202

Host crosby
	Hostname heapgw.dbalan.in
	Port 2203

Host  mercer
	Hostname heapgw.dbalan.in
	Port 2204
```

Now you can ssh to heap machines using their name, to connect to mercer run
```
ssh your_heap_user@mercer
```
