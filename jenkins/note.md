Jenkins+Maven+Git持续集成

三台服务器：
- Jenkins-GitLab-ssh
- Jenkins-Server
- TestServer : 也装了jdk
    ～/xyz    存放已经构建好的jar包的目录
        使用 $jps 命令 看一下有没有自动运行
        
        【jps(Java Virtual Machine Process Status Tool)是JDK提供的一个可以列出正在运行的Java虚拟机的进程信息的命令行工具，它可以显示Java虚拟机进程的执行主类（Main Class，main()函数所在的类）名称、本地虚拟机唯一ID（LVMID，Local Virtual Machine Identifier）等信息。另外，jps命令只能显示它有访问权限的Java进程的信息】

<img src="​https://github.com/bsun33/note/blob/main/images/jenkins_1.png​" width="300px">




