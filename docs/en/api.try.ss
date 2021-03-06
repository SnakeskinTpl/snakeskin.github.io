- namespace docs.en.api['1::Directives']['9::Working with exceptions']['1::try']

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

Директива *try* является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | Absent        | Block, logic | Not required |

## Description

Директива позволяет вашему шаблону отлавливать и обрабатывать исключения, которые могут возникать по ходу выполнения
программы на Snakeskin.

Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- try
	? 1 2
```

```classic
{try}
	{1 2}
{/try}
```

#{/}

The directive can be used anywhere. Вместе с основной
директивой можно использовать дополнительные:

1. `catch` - аналог `catch` в JS ([функциональная директива](#{@@guide}#introParams));
2. `finally` - аналог `finally` в JS.

### Examples

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	< .result
		- try
			? value = JSON.parse(value)

		- catch err
			? console.error(err)

		- finally
			Hello world!
```

```classic
{namespace demo}
{template index(value)}
	{< .result}
		{try}
			{? value = JSON.parse(value)}

		{catch err}
			{? console.error(err)}

		{finally}
			Hello world!
		{/}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
