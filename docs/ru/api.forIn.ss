- namespace docs.ru.api['1::Директивы']['8::Итераторы']['2::forIn']

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

Директива итерирует заданный объект (без учёта *hasOwnProperty*).

## Паспорт

| Декларация      | Короткий синтаксис | Тип директивы                       | Интерполяция |
|-----------------|--------------------|-------------------------------------|--------------|
| Без ограничений | Отсутствует        | Блочная, логическая, функциональная | Не требуется |

## Описание

Директива итерирует заданный объект с помощью функции
[Snakeskin.forIn](https://github.com/SnakeskinTpl/Snakeskin/blob/master/src/live/live.js#L308).

Общая форма директивы следующая:

```js
forIn ссылка на объект или сам объект => параметры функции через запятую
	команда
```

Например:

#{+= self.example()}

```jade-like
- forIn {a: 1, b: 2} => el
	{el}
```

```classic
{forIn {a: 1, b: 2} => el}
	{el}
{/forIn}
```

#{/}

Директива может использоваться как внутри шаблонов или других директив, так и в глобальной области,
а т.к. *forIn* является функциональной директивой, то он реализует [стандартный механизм декларации параметров](#{@@guide}#introParams).

Для управления обходом внутри итератора можно использовать директивы:

1. [break](#break) - полностью прерывает выполнение итератора;
2. [continue](#continue) - прерывает текущую итерацию и переходит к следующей.

### Параметры функции итератора

1. Значение элемента;
2. Ключ;
3. Ссылка на итерируемый объект;
4. Объект:
	* `i` - номер итерации;
	* `isFirst` - является ли элемент первым;
	* `isLast` - является ли элемент последним;
	* `length` - длина массива.

### forIn и [return](#return)

Несмотря на то что *forIn* использует функцию при обходе объекта, поведение директивы приближено к поведению цикла,
т.е. внутри можно использовать директивы *break*, *continue* и *return*, принцип работы которых не будет отличаться,
например:

#{+= self.example()}

```jade-like
- namespace demo

\/// Шаблон вернёт 1
- template index()
	- forIn {a: 1, b: 2} => el
		- return el
	Hello world
```

```classic
{namespace demo

\/// Шаблон вернёт 1
{template index()}
	{forIn {a: 1, b: 2} => el}
		{return el /}
	Hello world
```

#{/}

### Примеры
#### Простой перебор

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var obj = {a: 1, b: 2}
	- forIn obj => el, key
		{el} {key}
```

```classic
{namespace demo}
{template index()}
	{var obj = {a: 1, b: 2} /}
	{forIn obj => el, key}
		{el} {key}
	{/}
{/template}
```

#{/}


#### Перебор с заданием [with](#with) в списке входных параметров

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- var obj = {a: {name: 'Koba'}, b: {name: 'Over'}}
	- forIn obj => @el
		{@name}
```

```classic
{namespace demo}
{template index()}
	{var obj = {a: {name: 'Koba'}, b: {name: 'Over'}} /}
	{forEach obj => @el}
		{@name}
	{/}
{/template}
```

#{/}

#### Сброс итераций

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	- forEach {a: 1, b: 2, c: 3} => el
		{el}
		- break
```

```classic
{namespace demo}
{template index()}
	{forEach {a: 1, b: 2, c: 3} => el}
		{el}
		{break}
	{/}
{/template}
```

#{/}

#{/block}
{/template}
