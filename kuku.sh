#!/bin/bash 
# シェル名:kuku.sh
# 機能:①1以上20以下の整数nを与えられた時に、nの値に応じて
#        nxnの九九の表を表示する
#      ②nは1以上20以下の整数が入力されるまで繰り返し入力を求める
# written by : Yuta Shibuya (Yuta.Shibuya.36@outlook.jp)
# last update : 2025/2/11

# 整数nの取得
while true;do
	# 整数nの入力
	read -p "1以上20以下の整数を入力してください:" n

	# 引数が整数かどうか判断
	if [[ ! "$n" =~ ^[0-9]+$ ]]; then
		echo "入力内容:$n"
		echo "整数を入力してください"

	# 引数の範囲チェック 1以上20以下の整数であること
	elif [ "$n" -lt 1 ] || [ "$n" -gt 20 ]; then
		echo "入力内容:$n"
		echo "1より小さい、または20より大きい整数です"
	# 整数nが1以上20以下である場合は以下の処理に進む。
	else
		break
	fi
done

# 九九の表の出力
for i in `seq 1 $n`;do
	# 行の最後の数値を求める
	echo $i $n              |
	# 01:行数 02:最後の列
	awk '{print $1*$2}'     |
	# 01:最後の数値
	# 各行の開始から最後までの数字を行数分飛ばして出力
	xargs -I{} seq $i $i {} |
	# 横に並べる
	xargs
done

exit 0
