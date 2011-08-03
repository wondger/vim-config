set shortmess=atl "关闭显示援助提示
set nocompatible "gvim运行在增强模式下,不使用vi的键盘模式
source $VIMRUNTIME/vimrc_example.vim "载入vimrc_example.vim
source $VIMRUNTIME/mswin.vim "载入mswin.vim
behave mswin "?

"======================================
"字体设置
if has("win32")
    set gfn=Courier_New:h12 "guifont
    "set gfn=YaHei_mono:h12 "guifont
    "set gfw=YaHei_mono:h12 "guifontwide
	"exec 'set guifont='.iconv('Courier\ New', &enc, 'gbk').':h12:cANSI'
    "exec 'set guifontwide='.iconv('Yahei_Mono', &enc, 'gbk').':h11'
	
endif
"启动时窗口最大化
if has('gui_running')
	if has("win32")
		au GUIEnter * simalt ~x
	endif
endif

set nocp "不兼容模式
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set sm "showmatch 设置高亮匹配
set cino=:0,g0
set hls
set nu "显示行号
set ai "自动缩进
set si "智能缩进
set go= "set guioptions= 隐藏菜单栏
set helplang=cn "设置帮助语言
set incsearch "增量搜索
set completeopt=longest,menu
set mouse=a "所有模式下使用鼠标
set laststatus=2 "显示状态栏
"set autoread "自动加载

set syntax=on "语法高亮
set softtabstop=4
set tabstop=4
set shiftwidth=4
set confirm "在处理为保存或制度文件的时候，弹出确认
set autoindent "自动缩进
set cindent "C语言风格自动缩进
set foldmethod=indent "按缩进进行自动折叠
set tabstop=4 "tab键宽度
"set noexpandtab "不要用空格代替制表符
set expandtab "用空格代替制表符
set number "显示行号 
set ruler "右下角显示光标位置状态行
set iskeyword+=_,$,@,%,#,-,& "带有如下符号的单词不要被换行分割
set matchtime=5 "高亮显示匹配的括号
set smarttab "行首的 根据'sirtwidth'插入空白
let php_folding=1 "折叠类、函数等
set backspace=indent,eol,start "在插入状态下使用退格和delete
set showcmd "在状态栏显示目前所执行的指令
set showmatch "再输入括号时光标会短暂地跳到与之相匹配的括号处，不影响输入
let mapleader = ','
set tags=$VIM/vimfiles/tags "设置tags路径

" 自己写的几个命令
nmap <silent><leader>/ ^i//<esc>
imap <silent><leader>t <c-r>=strftime('%c')<cr>
au InsertLeave * write "退出insert模式时自动保存

" 判断操作系统
if (has("win32") || has("win64") || has("win32unix"))
    let g:isWin = 1
else
    let g:isWin = 0
endif

" 判断是终端还是gvim
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"在gvim中高亮当前行
if (g:isGUI)
	set cursorline
	hi cursorline guibg=grey25
    hi cursorcolumn guibg=grey25
endif

" 设置字符集编码，默认使用utf8
set nobomb "去掉utf-bom
if (g:isWin)
    let &termencoding=&encoding " 通常win下的encoding为cp936
    set fileencodings=utf8,gb2312,gbk,cp936,ucs-bom,latin1
else
    set encoding=utf8
    set fileencodings=utf8,gb2312,gbk,gb18030,ucs-bom,latin1
endif
"设置新建保存编码为utf-8
map <leader>fu :se fenc=utf-8<cr>
map <leader>fg :se fenc=gb2312<cr>

" 快捷输入
" 自动完成括号和引号
inoremap ( ()<esc>:let leavechar=")"<cr>i
inoremap [ []<esc>:let leavechar="]"<cr>i
inoremap { {}<esc>:let leavechar="}"<cr>i
inoremap ' ''<esc>:let leavechar="'"<cr>i
inoremap " ""<esc>:let leavechar='"'<cr>i

"filetype setting
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
if has("autocmd") && exists("+omnifunc")
     autocmd Filetype *
   \ if &omnifunc == "" |
   \   setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
"let g:rubycomplete_rails = 1

"fast loading _vimrc && edit && source it after edit
"error
map <silent><leader>src :source $MYVIMRC<cr>
noremap <silent><leader>rc :tabnew $MYVIMRC<cr>
autocmd! bufwritepost _vimrc source $MYVIMRC

"=======================================
"文件设置
set nobackup "禁止生成备份文件
set noswapfile "禁止生成临时文件
set autowrite "自动保存
filetype plugin indent on "打开文件内容监测，为特定的文件类型载入插件，为不同的文件类型定义不同的缩进格式

"=======================================
"快捷键/映射
nmap <silent><S-n> :NewTemplateTab nie<cr>
nmap <silent><S-m> :NewTemplateTab sw<cr>
nmap <silent><S-j> :NewTemplateTab js<cr>
nmap <silent><S-s> :NewTemplateTab css<cr>
nmap <silent><S-p> :NewTemplateTab php<cr>
nmap <silent><S-x> :NewTemplateTab xml<cr>
map <silent><S-f><S-h> :set filetype=xhtml "filetype html<cr>
map <silent><S-f><S-j> :set filetype=javascript "filetype javascript<cr>
map <silent><S-f><S-c> :set filetype=css "filetype css<cr>
map <silent><S-f><S-p> :set filetype=php "filetype php<cr>
map <silent><C-Tab> :tabn<cr>

" 在文件名上按gf时，在新的tab中打开
map <silent>gf :tabnew <cfile><cr>
map <S-F> :tabnew <cfile><cr>
map <silent><leader>q :q<cr>
map <silent>Q ZQ<cr>
map <leader>n :new 
map <leader>s :se 

map <C-t> :tabnew 
map <leader>ss :source $VIM/
map <leader>t :tabnew 
map <leader>e :e 
map <leader>ms :mksession! $VIM/
map <leader>wi :wviminfo 
map <leader>ri :rviminfo 
map <leader>vsf :vertical sfind 
map <silent><leader>w :w<cr>

inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>

nmap <Tab> <C-W><C-W>
map <leader>ftp :tabnew ftp://username@address/path
map <leader>fa :tabnew ftp://wangjian@123.58.175.155[32212]/<cr>
map <leader>fm :tabnew ftp://wondger@122.115.33.115/domains/omiga.org/public_html/<cr>

""""""""""""""""""""""""""""""
" ftp settings
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"plugin settings
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"NERD_Commenter settings
""""""""""""""""""""""""""""""
map <leader>z <leader>cc
map <leader>zs <leader>cs
map <leader>zu <leader>cu
""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
"nmap <silent><leader>d :Sexplore!<cr>
"nmap <leader>ep :Explore 
nmap <silent><leader>d :NERDTree<cr>

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
let Tlist_Auto_Open = 1				   "自动打开taglist
map <silent> <F9> :TlistToggle<cr>

""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWindowLayout = "FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>

""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr = '"./filenametags"'
endif
"映射LookupFile为,lk
nmap <silent><leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <silent><leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent><leader>lw :LUWalk<cr>

""""""""""""""""""""""""""""""
" SuperTab setting
""""""""""""""""""""""""""""""
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-T>" 

set diffexpr=MyDiff()

if (has("gui_running"))
" 图形界面下不折叠代码
    set nowrap
    set guioptions+=b
    colo torte
else
" vim下折叠代码，配色选为ron
    set wrap
    colo ron
endif

function! MyDiff()
let opt = '-a --binary '
if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
let arg1 = v:fname_in
if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
let arg2 = v:fname_new
if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
let arg3 = v:fname_out
if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
let eq = ''
if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
else
    let cmd = $VIMRUNTIME . '\diff'
endif
silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
