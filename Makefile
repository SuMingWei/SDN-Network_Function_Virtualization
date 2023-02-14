all:
	sudo docker compose up -d
	sudo ovs-vsctl add-br OVSbr
	sudo ip link set OVSbr up 
	sudo ovs-docker add-port OVSbr eth1 R1 --ipaddress=172.20.0.2/24
	sudo ovs-docker add-port OVSbr eth1 R2 --ipaddress=172.20.0.3/24
	sudo ovs-docker add-port OVSbr eth1 R3 --ipaddress=172.20.0.4/24
	sudo ovs-vsctl set-controller OVSbr tcp:127.0.0.1:6653
	sudo ovs-vsctl set bridge OVSbr protocol=OpenFlow14
clean:
	sudo ip link set OVSbr down 
	sudo ovs-vsctl del-br OVSbr
	sudo docker compose down