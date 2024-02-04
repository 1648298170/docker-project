echo '###########start service#############'

# 给中文字体执行权限，给予索引，更新缓存
chmod -R 755 /usr/share/fonts/Chinese
mkfontscale
mkfontdir
fc-cache

# 服务端安装模块包，但不编译(在 ci/cd 服务器编译)
cd /data/projects/nest_project/nest_final
cnpm install

npm run build:prod

# 编译请在 gitlab 之类平台服务器， 然后通过scp传送到本生产环境，勿在生产环境服务器编译

# 启动
pm2 start /data/ecosystem.config.js

exec tail -f /dev/null
