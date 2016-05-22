- namespace docs.en.api['1::Directives']['1::Creating templates']['6::set']

/*!
 * snakeskin.github.io
 * https://github.com/SnakeskinTpl/snakeskin.github.io
 *
 * Released under the MIT license
 * https://github.com/SnakeskinTpl/snakeskin.github.io/blob/master/LICENSE
 */

- include '../../tpls/modules/base'

{template main[%fileName%]() extends base.main}
#{block root}

Директива задаёт значение указанному [параметру трансляции](#{@@guide}#introSet).

## Synopsis

| Declaration                  | Shorthand | Directive type         | Interpolation |
|-----------------------------|--------------------|-----------------------|--------------|
| Only in the global scope | `@=`               | Inline, logic | Not required |

## Поддерживаемые параметры

* [renderMode](#{@@api}#compile--renderMode)
* [renderAs](#{@@api}#compile--renderAs)
* [localization](#{@@api}#compile--localization)
* [i18nFn](#{@@api}#compile--i18nFn)
* [i18nFnOptions](#{@@api}#compile--i18nFnOptions)
* [literalBounds](#{@@api}#compile--literalBounds)
* [bemFilter](#{@@api}#compile--bemFilter)
* [filters](#{@@api}#compile--filters)
* [language](#{@@api}#compile--language)
* [ignore](#{@@api}#compile--ignore)
* [tolerateWhitespaces](#{@@api}#compile--tolerateWhitespaces)
* [doctype](#{@@api}#compile--doctype)

#{/block}
{/template}