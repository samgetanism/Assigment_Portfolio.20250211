#!/bin/bash 
# シェル名:doppel.sh
# 機能:dummy_emails.csvに書かれたメールアドレスから
#      gmail.comとicloud.com以外のメールの個数を数える
# written by : Yuta Shibuya (Yuta.Shibuya.36@outlook.jp)
# last update : 2025/2/11


# メールアドレスを出力
cat dummy_emails.csv    |
# ヘッダーの削除
sed 1d                  |
# 最終行に改行を追加する
xargs -n1               |
# 01:Email
# @を除外する
sed 's/@/ /g'           |
# 01:Email(@手前) 02:ドメイン名
# ドメインに絞る
awk '{print $2}'        |
# 01:ドメイン名
# gmail.comとicloud.comを除外する
grep -v gmail.com       |
grep -v icloud.com      |
# 重複をカウントする
sort                    |
uniq -c                 |
# 01:個数 02:不正ドメイン名
# 降順でソートする
sort -nr                


exit 0
