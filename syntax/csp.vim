" Vim syntax file
" Language:        csp
" Version:         0.1
" Maintainer:      tanglong3bf <tanglong3bf@163.com>
" Last Change:     2022 Aug 28

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
unlet b:current_syntax

syn case match
syn include @cpp $VIMRUNTIME/syntax/cpp.vim

syn match cspHttpViewData /@@/ contained
syn match cspStream /\$\$/ contained

syn region cspScriptlet matchgroup=cspTag start=/<%inc/ end=/%>/ keepend contains=cInclude
syn region cspState matchgroup=cspTag start=/<%c++/ end=/%>/ keepend contains=@cpp,cspHttpViewData,cspStream
syn region cspVariable matchgroup=cspTag start=/\[\[/ end=/\]\]/ oneline
syn region cspExpression matchgroup=cspTag start=/{%/ end=/%}/ keepend contains=cString oneline
syn region cspViewTag matchgroup=cspTag start=/{%view/ end=/%}/ keepend oneline
syn region cspLayoutTag matchgroup=cspTag start=/{%layout/ end=/%}/ keepend oneline

syn clear htmlTag
syn region htmlTag start=+<[^/%]+ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster,cspExpression,javaScript

hi def link cspTag htmlTag
hi def link cspHttpViewData Identifier
hi def link cspStream Identifier

let b:current_syntax = "csp"

" vim: ts=8
