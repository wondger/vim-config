set shortmess=atl "�ر���ʾԮ����ʾ
set nocompatible "gvim��������ǿģʽ��,��ʹ��vi�ļ���ģʽ
source $VIMRUNTIME/vimrc_example.vim "����vimrc_example.vim
source $VIMRUNTIME/mswin.vim "����mswin.vim
behave mswin "?

"======================================
"��������
if has("win32")
    set gfn=Courier_New:h12 "guifont
    "set gfn=YaHei_mono:h12 "guifont
    "set gfw=YaHei_mono:h12 "guifontwide
	"exec 'set guifont='.iconv('Courier\ New', &enc, 'gbk').':h12:cANSI'
    "exec 'set guifontwide='.iconv('Yahei_Mono', &enc, 'gbk').':h11'
	
endif
"����ʱ�������
if has('gui_running')
	if has("win32")
		au GUIEnter * simalt ~x
	endif
endif

set nocp "������ģʽ
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set sm "showmatch ���ø���ƥ��
set cino=:0,g0
set hls
set nu "��ʾ�к�
set ai "�Զ�����
set si "��������
set go= "set guioptions= ���ز˵���
set helplang=cn "���ð�������
set incsearch "��������
set completeopt=longest,menu
set mouse=a "����ģʽ��ʹ�����
set laststatus=2 "��ʾ״̬��
"set autoread "�Զ�����

set syntax=on "�﷨����
set softtabstop=4
set tabstop=4
set shiftwidth=4
set confirm "�ڴ���Ϊ������ƶ��ļ���ʱ�򣬵���ȷ��
set autoindent "�Զ�����
set cindent "C���Է���Զ�����
set foldmethod=indent "�����������Զ��۵�
set tabstop=4 "tab�����
"set noexpandtab "��Ҫ�ÿո�����Ʊ��
set expandtab "�ÿո�����Ʊ��
set number "��ʾ�к� 
set ruler "���½���ʾ���λ��״̬��
set iskeyword+=_,$,@,%,#,-,& "�������·��ŵĵ��ʲ�Ҫ�����зָ�
set matchtime=5 "������ʾƥ�������
set smarttab "���׵� ����'sirtwidth'����հ�
let php_folding=1 "�۵��ࡢ������
set backspace=indent,eol,start "�ڲ���״̬��ʹ���˸��delete
set showcmd "��״̬����ʾĿǰ��ִ�е�ָ��
set showmatch "����������ʱ������ݵ�������֮��ƥ������Ŵ�����Ӱ������
let mapleader = ','
set tags=$VIM/vimfiles/tags "����tags·��

" �Լ�д�ļ�������
nmap <silent><leader>/ ^i//<esc>
imap <silent><leader>t <c-r>=strftime('%c')<cr>
au InsertLeave * write "�˳�insertģʽʱ�Զ�����

" �жϲ���ϵͳ
if (has("win32") || has("win64") || has("win32unix"))
    let g:isWin = 1
else
    let g:isWin = 0
endif

" �ж����ն˻���gvim
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"��gvim�и�����ǰ��
if (g:isGUI)
	set cursorline
	hi cursorline guibg=grey25
    hi cursorcolumn guibg=grey25
endif

" �����ַ������룬Ĭ��ʹ��utf8
set nobomb "ȥ��utf-bom
if (g:isWin)
    let &termencoding=&encoding " ͨ��win�µ�encodingΪcp936
    set fileencodings=utf8,gb2312,gbk,cp936,ucs-bom,latin1
else
    set encoding=utf8
    set fileencodings=utf8,gb2312,gbk,gb18030,ucs-bom,latin1
endif
"�����½��������Ϊutf-8
map <leader>fu :se fenc=utf-8<cr>
map <leader>fg :se fenc=gb2312<cr>

" �������
" �Զ�������ź�����
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
"�ļ�����
set nobackup "��ֹ���ɱ����ļ�
set noswapfile "��ֹ������ʱ�ļ�
set autowrite "�Զ�����
filetype plugin indent on "���ļ����ݼ�⣬Ϊ�ض����ļ�������������Ϊ��ͬ���ļ����Ͷ��岻ͬ��������ʽ

"=======================================
"��ݼ�/ӳ��
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

" ���ļ����ϰ�gfʱ�����µ�tab�д�
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
let Tlist_Show_One_File = 1            "��ͬʱ��ʾ����ļ���tag��ֻ��ʾ��ǰ�ļ���
let Tlist_Exit_OnlyWindow = 1          "���taglist���������һ�����ڣ����˳�vim
let Tlist_Use_Right_Window = 1         "���Ҳര������ʾtaglist���� 
let Tlist_Auto_Open = 1				   "�Զ���taglist
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
let g:LookupFile_MinPatLength = 2               "��������2���ַ��ſ�ʼ����
let g:LookupFile_PreserveLastPattern = 0        "�������ϴβ��ҵ��ַ���
let g:LookupFile_PreservePatternHistory = 1     "���������ʷ
let g:LookupFile_AlwaysAcceptFirst = 1          "�س��򿪵�һ��ƥ����Ŀ
let g:LookupFile_AllowNewFiles = 0              "�������������ڵ��ļ�
if filereadable("./filenametags")                "����tag�ļ�������
let g:LookupFile_TagExpr = '"./filenametags"'
endif
"ӳ��LookupFileΪ,lk
nmap <silent><leader>lk :LUTags<cr>
"ӳ��LUBufsΪ,ll
nmap <silent><leader>ll :LUBufs<cr>
"ӳ��LUWalkΪ,lw
nmap <silent><leader>lw :LUWalk<cr>

""""""""""""""""""""""""""""""
" SuperTab setting
""""""""""""""""""""""""""""""
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-T>" 

set diffexpr=MyDiff()

if (has("gui_running"))
" ͼ�ν����²��۵�����
    set nowrap
    set guioptions+=b
    colo torte
else
" vim���۵����룬��ɫѡΪron
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
