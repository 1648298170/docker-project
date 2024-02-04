
//pm2 配置文件
module.exports = {
    apps: [
        {
            name: "prod-server",
            script: "./main.js",//相对于 pm2 start 的脚本路径
            // 改为docker项目映射的地址
            cwd: "/data/projects/nest_project/nest_final/dist/",//将启动您的应用程序的目录
            // Options reference: https://pm2.io/doc/en/runtime/reference/ecosystem-file/
            // args: 'one two',
            autorestart: true,//自动重启
            watch: true,//启用监视和重启功能
            ignore_watch: ["public/**", "node_modules"],//通过监视功能忽略某些文件或文件夹名称的正则表达式列表
            //应用程序中的 env 变量
            env: {
                NODE_ENV: "production",
            },
        },
    ],
};
