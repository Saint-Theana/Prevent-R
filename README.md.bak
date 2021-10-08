黑域一键补丁 使用说明

https://github.com/Saint-Theana/Prevent-Q

声明:本人仅仅参考了某人为Miui做的黑域补丁，修改原黑域补丁脚本得到本仓库的内容(原帖:https://www.coolapk.com/feed/28578557?shareKey=OTVkNzFlYjVkZjIzNjE2MDZlYTY~&shareUid=1163547&shareFrom=com.coolapk.market_11.0.3)

安卓10: <br />
需要python和openjdk<br />
开始之前请看第七:<br />

这里本人的系统虽然是odex化但是services.jar是完整的，大小为10M左右。<br />
如果你的系统也是odex化的而且services.jar不完整(很小)，那么请参考别的文档反编译services.jar<br />
一:将/system/framework/services.jar复制到work_dir目录中<br />
二:用apktool将service.jar反编译成smali:<br />

​```bash
java -Xmx800m -jar apktool_2.6.0.jar d work_dir/services.jar  -o services
```

三:打补丁<br />

​```bash
python3 patch_Q.py -a apk_Q -s services
```
理论上一共会打22处
IntentResolver patched 2
ActivityStack patched 4
ActivityRecord patched 1
ProcessList patched 2
MediaFocusControl patched 3
Vpn patched 1
ConnectivityService patched 1
ActivityStackSupervisor patched 2
ActivityManagerService patched 6
copying PreventRunning
copying PreventRunningHook
copying PreventRunningUtils


四:用apktool将service目录的smali反编译成dex:<br />

​```bash
java -Xmx800m -jar apktool_2.6.0.jar  b services -o services.jar
​```

得到的services.jar里的dex就是成品，把原services.jar里面的两个dex(安卓10一般是两个吧)替换掉就行了<br />

五:安装请参考别的文档或者看第六

六:magisk大法，本仓库里会提供一个magisk模块(BreventPatch-v2.zip)，替换掉里面的services.jar然后刷进去就行了<br />

七:给smali打patch极其困难(之前对我来说，也许是我太菜了吧)，<br />
   我没办法保证这个补丁一定能用(即使在本人手机上测试通过)，<br />
   因为每个系统的services.jar的源码不可能一样，而且编译的时候优化也不一样，<br />
   所以导致了寄存器(请搜索smali 寄存器)极其混乱，我已经尽可能地优化补丁脚本，<br />
   如开不了机，请打开adb调试在开机的时候连接电脑获取log然后提交issue。<br />
   还有强制修改/system目录下的services.jar可能导致bootloop(开不了机)<br />
   请在修改之前做好备份，以及确定自己有救砖的办法。比如安装了twrp，<br />
   开不了机就进twrp删除/data/adb/modules/BreventPatch/system/framework/services.jar (magisk)<br />
   或者用twrp里的文件管理器还原/system/framework/services.jar<br />
   或者用twrp备份的/system镜像还原都可<br />

八:这个仓库里的黑域跟原黑域有几处不同<br />
    1:优化音乐<br />
    2:优化vpn<br />
    详情看https://www.coolapk.com/feed/30502584?shareKey=NWFjNmVkY2ZhMzRiNjE2MDZjZWU~&shareUid=1163547&shareFrom=com.coolapk.market_11.0.3<br />
    
