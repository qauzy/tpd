<div align="center">

<h1>TPD(Docker容器透明代理)</h1>

TPD(Transparent proxy tool for Docker)，是一个用于 Docker容器内部 的透明代理辅助工具, 原理是通过共享一个内部运行Clash的容器网络，实现其他容器内部透明代理的效果

</div>

## 构建容器
```
git clone https://github.com/qauzy/tpd.git
cd tpd
docker build -t  mat  .
```

## 运行容器
/data/clash/xclash.yaml替换成你自己的配置文件
```
docker rm -f mat && docker run -d --name mat   --cap-add=NET_ADMIN   -v /data/clash/xclash.yaml:/root/.config/mat/config.yaml   -v /dev/net/tun:/dev/net/tun   -i -t   mat
```

## 查看代理容器日志
```
docker logs -f mat
```

## 测试
```
run -it --rm --network container:mat  busybox
wget https://www.google.com
```
