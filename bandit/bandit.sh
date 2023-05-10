#!/usr/bin/bash
bandit() {
	if [[ $# -eq 0 ]]; then
		echo "如需退出请按Ctrl+C"
		while true
		do
			echo "目前已通关卡：$(bandit show)"
			num=$(tail -n1 ./passwd | cut -d " " -f 1 | cut -d t -f 2)

			echo "最新关卡为第${num}关，连接中....."
			bandit play $num 
			echo -n  "你找到密码了吗？y/n "
			read yn
			if [[ $yn = n ]]; then
				echo "请重新挑战本关卡！"
				continue
			fi
			bandit add $((num+1))
		done
	fi
	case $1 in
		update)
			sort -n -t t -k 2 -u ./passwd -o ./passwd # 排序去重
			cat ./passwd | tr -s '\n' | tee ./passwd &> /dev/null # 去除空行
			;;
		show)
			if [[ ! -s ./passwd ]]; then
				echo "bandit0 bandit0" > ./passwd
			fi
			bandit update
			echo $(cat ./passwd | cut -d " " -f 1 | cut -d t -f 2)
			;;
		del)
			sed -i "/bandit$2/d" ./passwd
			;;
		get)
			psd=$(grep bandit$2 ./passwd 2>&1)
			echo $psd | grep bandit &> /dev/null
			if [[ $? -eq 0 ]]; then
				echo -n $(echo $psd | cut -d " " -f 2)
				return 0
			else
				return 1
			fi
			;;
		add)
			echo -n "请输入bandit$2的密码："
			read psd
			echo "正在验证该密码...."
			bandit connect $2 "$psd" 'echo "密码正确！"'
			ch=$?
			if [[ $ch -eq 5 ]]; then
				echo "密码错误！"
				return 1
			fi
			old=$(bandit get $2)
			if [[ $? -eq 1 ]]; then
				echo "bandit$2密码已保存！" 
				echo "bandit$2 $psd" >> ./passwd
			else
				echo "bandit$2密码已更新！"
				sed "s/$old/$psd/g" ./passwd > /dev/null
			fi
			bandit update
			;;
		connect)
			sshpass -p "$3" ssh -o StrictHostKeyChecking=no bandit$2@bandit.labs.overthewire.org -p 2220 $4
			sshcode=$?
			if [[ $sshcode -eq 0 ]]; then
				return 0
			fi
			if [[ $sshcode -eq 5 ]]; then
				echo "密码错误！"
				return $sshcode
			else
				echo "ssh连接失败，错误码：$sshcode"
				echo "尝试重连中......"
				bandit connect $2 "$3" "$4"
			fi
			;;
		play)
			bandit connect $2 "$(bandit get $2)" 
			;;
		*)
			echo "命令不存在！"
			echo "以下是几个可能的命令："
			echo "---------------------------------------"
			echo "bandit update：排序去重密码索引文件"
			echo "bandit show：列出所有有密码的关卡"
			echo "bandit del n：删除第n关的密码"
			echo "bandit get n：获取第n关的密码"
			echo "bandit add n：更新第n关的密码，并update"
			echo "bandit play n：挑战第n关"
			echo "---------------------------------------"
			echo "bandit：自动挑战最新关卡，并连续进入下一关"
			;;
	esac
}
sudo apt install -y sshpass
clear
