git_repository=$1
echo git repository address is $git_repository

remove_http=${git_repository##*/}
echo remove http: $remove_http

app_name=${remove_http%%.git}
echo folder name is $app_name

git clone $git_repository

echo start compile exectuable
docker run --rm -v "$PWD/$app_name":/usr/src/myapp -w /usr/src/myapp golang:1.17 go build -v -o app 

echo start build docker image
docker build --build-arg EXEC_DIR=$app_name . -t fudute/$app_name

docker push fudute/$app_name

## 清理工作
echo clean....
rm -rf $app_name
