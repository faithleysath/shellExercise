marco(){
	echo "$(pwd)" > /tmp/marco.tmp
	echo "以保存：$(pwd)"
}
polo(){
	cd "$(cat /tmp/marco.tmp)"
}
