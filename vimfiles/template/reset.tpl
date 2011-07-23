@charset "gb2312";
/*CSS Document by wondger[at]gmail[dot]com*/
/*reset*/
body, h1, h2, h3, h4, h5, h6, hr, p, blockquote, /* structural elements 结构元素 */
dl, dt, dd, ul, ol, li, /* list elements 列表元素 */
pre, /* text formatting elements 文本格式元素 */
form, fieldset, legend, button, input, textarea, /* form elements 表单元素 */
th, td /* table elements 表格元素 */ {
    margin: 0;
    padding: 0;
}

/** 设置默认字体 **/
body,
button, input, select, textarea /* for ie */ {
    font: 12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif;
}
h1, h2, h3, h4, h5, h6 { font-size: 100%; }
address, cite, dfn, em, var { font-style: normal; } /* 将斜体扶正 */
code, kbd, pre, samp { font-family: courier new, courier, monospace; } /* 统一等宽字体 */
small { font-size: 12px; } /* 小于 12px 的中文很难阅读，让 small 正常化 */

/** 重置列表元素 **/
ul, ol { list-style: none; }

/** 重置文本格式元素 **/
a { text-decoration: none; }
a:hover { text-decoration: underline; }

sup { vertical-align: text-top; } /* 重置，减少对行高的影响 */
sub { vertical-align: text-bottom; }

/** 重置表单元素 **/
legend { color: #000; } /* for ie6 */
fieldset, img { border: 0; } /* img 搭车：让链接里的 img 无边框 */
button, input, select, textarea { font-size: 100%; } /* 使得表单元素在 ie 下能继承字体大小 */
/* 注：optgroup 无法扶正 */

/** 重置表格元素 **/
table { border-collapse: collapse; border-spacing: 0; }

/* 重置 HTML5 元素 */
article, aside, details, figcaption, figure, footer,header, hgroup, menu, nav, section,
summary, time, mark, audio, video {
    display: block;
    margin: 0;
    padding: 0;
}
mark { background: #ff0; }
/*reset*/

/*clearfix*/
.clearfix{zoom:1;}
.clearfix:after{content:"";display:block;clear:both;visibility:hidden;height:0;}
