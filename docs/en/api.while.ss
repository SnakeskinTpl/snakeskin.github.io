- namespace docs.en.api['1::Directives']['7::Циклы']['2::while']

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

Директива *while* является эквивалентом одноименного оператора в различных языках программирования и по своей семантике
близка к реализации в JavaScript.

## Synopsis

| Declaration      | Shorthand | Directive type       | Interpolation |
|-----------------|--------------------|---------------------|--------------|
| No limits | Absent        | Block, logic | Not required |

## Description

Директива создаёт цикл, т.е. блок цикла будет выполняется до тех пор, пока управляющее логическое
выражение не станет ложным or пока цикл не будет сброшен вручную.

Директива начинается с ключевого слова `while`, которое должно сопровождаться выражением
(заключать выражение в скобки не обязательно).

Самая простая форма выглядит так:

#{+= self.example()}

```jade-like
- var i = 3
- while i--
	{i}
```

```classic
{var i = 3 /}
{while i--}
	{i}
{/while}
```

#{/}

The directive can be used anywhere.
Для управления циклом внутри блока можно использовать директивы:

1. [break](#break) - полностью прерывает выполнение цикла;
2. [continue](#continue) - прерывает текущую итерацию и переходит к следующей.

### Examples
#### Перебор массива

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var arr = [1, 2, 3]
	- while arr.length
		{arr[0]}
		? arr.shift()
```

```classic
{namespace demo}
{template index()}
	{var arr = [1, 2, 3] /}
	{while arr.length}
		{arr[0]}
		{? arr.shift()}
	{/}
{/template}
```

#{/}

#### Сброс итераций

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var i = 3
	- while i--
		{i}
		- break
```

```classic
{namespace demo}
{template index()}
	{var i = 3 /}
	{while i--}
		{i}
		{break}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
