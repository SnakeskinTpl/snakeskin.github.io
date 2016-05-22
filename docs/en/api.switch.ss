- namespace docs.en.api['1::Directives']['6::Logic directives']['3::switch']

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

Директива *switch* является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript (`break` ставится автоматически после каждого блока *case*).

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | `>` (для *case*)   | Block, logic | Not required |

## Description

Подобно [if](#if) or [unless](#unless) директива позволяет вашему шаблону в зависимости от условий выполнить некоторую логику
или сгенерировать фрагмент шаблона, основываясь на значении переменной or выражения, но предоставляет более удобный
синтаксис когда нужно сравнить выражение сразу с несколькими вариантами.

Директива начинается с ключевого слова `switch`, которое должно сопровождаться выражением
(заключать выражение в скобки не обязательно), а внутри директивы должны использоваться вспомогательные директивы
*case* и/или *default*. The directive can be used anywhere.

Директива *case* начинается с ключевого слова `case` (или символа `>`), а после должно следовать выражение выражение
для сравнения со *switch*. В отличии от реализации *case* в JS - оператор `break` ставиться автоматически после каждого
блока.

Декларация *default* полностью идентичная аналогичной в JS.

### Examples

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	< .result
		- switch value
			- case 1
				< .value-1
					value == 1

			- case 2
				< .value-2
					value == 2

			> 3
				< .value-3
					value == 3

			- default
				Условие, которое выполнится по умолчанию.
```

```classic
{namespace demo}
{template index(value)}
	{< .result}
		{switch value}
			{case 1}
				{< .value-1}
					value == 1
				{/}
			{/}

			{case 2}
				{< .value-2}
					value == 2
				{/}
			{/}

			{> 3}
				{< .value-3}
					value == 3
				{/}
			{/}

			{default}
				Условие, которое выполнится по умолчанию.
			{/}
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}