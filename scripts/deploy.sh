npm run build

docker rmi chie-touch
docker build -t chie-touch .
docker save chie-touch > image.tar

scp image.tar root@193.112.127.195:~
ssh root@193.112.127.195 "/root/deploy_scripts/deploy_chie.sh"

rm -f image.tar
