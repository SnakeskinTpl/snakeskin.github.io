- namespace docs.en.api['1::Directives']['2::Execution / output']['4::return']

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

Директива *return* является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Synopsis

| Declaration                            | Shorthand | Directive type       | Interpolation |
|---------------------------------------|--------------------|---------------------|--------------|
| Только внутри функциональных директив | Absent        | Block, logic | Not required |

## Description

Большинство [функциональных директив](#{@@guide}#introParams) Snakeskin возвращают свой результат автоматически, но
иногда бывает нужно вернуть определённый ответ в зависимости от условия, or если возвращаемое значение отлично от
стандартного ответа Snakeskin.

Директива начинается с ключевого слова `return`, которое может сопровождаться ссылкой на возвращаемое значение или
выражение, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- return 1 + 2
```

```classic
{namespace demo}
{template index()}
	{return 1 + 2 /}
{/template}
```

#{/}

Для удобства использования *return* в классическом синтаксисе существует короткая форма закрытия директивы, например:

```classic
\/// Обычное закрытие
{return 1 + 2}{/}

\/// Короткая форма закрытия
{return 1 + 2 /}
```

Директива может использоваться только внутри функциональных директив.

### Расширенная декларация

Директива может включать возвращаемое значение в своё тело - это удобно, когда возвращаемое значение является подшаблоном,
например:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	\/// Шаблон вернёт ссылку на функцию,
	\/// которая складывает два числа
	- return
		() => a, b
			- return a + b
```

```classic
{namespace demo}
{template index()}
	\/// Шаблон вернёт ссылку на функцию,
	\/// которая складывает два числа
	{return}
		{() => a, b}
			{return a + b /}
		{/}
	{/}
{/template}
```

#{/}

Внутри такой декларации можно использовать любые допустимые директивы, например, [if](#if), [forEach](#forEach) и т.д..

#{/block}
{/template}
