1）进入tmux面板后，一定要先按ctrl+b，然后松开，再按其他的组合键才生效。

2）常用到的几个组合键：
ctrl+b ?            显示快捷键帮助
ctrl+b 空格键       采用下一个内置布局，这个很有意思，在多屏时，用这个就会将多有屏幕竖着展示
ctrl+b !            把当前窗口变为新窗口
ctrl+b  "           模向分隔窗口
ctrl+b %            纵向分隔窗口
ctrl+b q            显示分隔窗口的编号
ctrl+b o            跳到下一个分隔窗口。多屏之间的切换
ctrl+b 上下键      上一个及下一个分隔窗口
ctrl+b C-方向键    调整分隔窗口大小
ctrl+b &           确认后退出当前tmux
ctrl+b [           复制模式，即将当前屏幕移到上一个的位置上，其他所有窗口都向前移动一个。
ctrl+b c           创建新窗口
ctrl+b n           选择下一个窗口
ctrl+b l           最后使用的窗口
ctrl+b p           选择前一个窗口
ctrl+b w           以菜单方式显示及选择窗口
ctrl+b s           以菜单方式显示和选择会话。这个常用到，可以选择进入哪个tmux
ctrl+b t           显示时钟。然后按enter键后就会恢复到shell终端状态
ctrl+b d           脱离当前会话；这样可以暂时返回Shell界面，输入tmux attach能够重新进入之前的会话



tmux set -g prefix C-x
➜  ~ tmux show-options -g | grep prefix




tuple，可以说是不可变的list，访问方式还是通过索引下标的方式。
当你明确定义个tuple是，如果仅有一个元素，必须带有,例如：(1,)。
当然，在2.7以后的版，python里还增加了命名式的tuple！
至于有什么用，首先第一点，楼主玩过python都知道，python的函数可以有多返回值的，而python里，多返回值，就是用tuple来表示，这是用的最广的了，
比如说，你需要定义一个常量的列表，但你又不想使用list，那也可以是要你管tuple，例如：
if a in ('A','B','C'):pass
最后，欢迎来到我的python小组：fashtime.com,交流更多python的问题
