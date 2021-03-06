- namespace docs.ru.guide['2::Основы']['3::Декларация шаблона и вывод данных']

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

Шаблон - это главная функциональная ячейка Snakeskin, которая является синонимом функции в JavaScript, т.е. после
трансляции все шаблоны будут представлены как JS функции, которые можно использовать вместе с любым другим JS кодом.

Объявление шаблона возможно с помощью директив [template](#{@@api}#template), [interface](#{@@api}#interface) и
[placeholder](#{@@api}#placeholder). Шаблон не может включать в себя другой шаблон, для этого есть другие директивы.

Название шаблона соответствует названию функции в JavaScript, поэтому оно подчиняется тем же правилам.

## Пространства имён

Все шаблоны Snakeskin декларируются в пространстве имён, которое обязан задать сам разработчик с помощью директивы
[namespace](#{@@api}#namespace), причём в рамках одного файла Snakeskin может существовать только одно пространство имён,
т.е.:

#{+= self.example()}

```jade-like
- namespace demo
- namespace bar \/// Ошибка
```

```classic
{namespace demo}
{namespace bar} \/// Ошибка
```

#{/}

Каждое пространство имён является свойством корневого объекта **exports**, которое является глобальным для всех файлов
Snakeskin и осуществляет экспорт шаблонов в JavaScript.

В рамках одного пространства имён не может быть двух шаблонов с одинаковым названием,
т.е. переопределять шаблоны в Snakeskin нельзя.

## Механика шаблонов

Snakeskin в известном смысле - макроязык, в нём нет оператора print, т.е. весь текст, набранный в исходном файле,
суть большой оператор print. Директивы Snakeskin являются погруженными в текст.
Получается, что вы не пишете программу, которая выводит текст - наоборот, в имеющийся текст вы добавляете логику и организацию,
блоки (методы), на которые вы разбиваете код:

#{+= self.example()}

```jade-like
- namespace demo
- template hello()
	Hello world!
```

```classic
{namespace demo}
{template hello()}
	Hello world!
{/template}
```

#{/}

В JS такое будет выглядеть как:

```js
if (exports.demo === 'undefined') {
	var demo = exports.demo = {};
}

exports.demo.hello = function hello() {
	return 'Hello world!';
};
```

## Вывод значений

Snakeskin позволяет разработчику вставлять в статичный текст шаблона динамические JavaScript выражения, например,
вызовы функций, значения переменных, результат математических операций и т.д.. Для этого используется специальная директива
[output](#{@@api}#output). Давайте усложним пример данный выше: будем выводить приветствие по заданному параметру-имени.

#{+= self.example()}

```jade-like
- namespace demo
- template hello(name)
	\/// Можно было бы написать {output name},
	\/// но внутри шаблонов директива output
	\/// имеет более удобную короткую форму вызова и поэтому
	\/// достаточно просто взять выводимое выражение в фигурные скобки
	Hello {name}!
```

```classic
{namespace demo}
{template hello(name)}
	\/// Можно было бы написать {output name},
	\/// но внутри шаблонов директива output
	\/// имеет более удобную короткую форму вызова и поэтому
	\/// достаточно просто взять выводимое выражение в фигурные скобки
	Hello {name}!
{/template}
```

#{/}

Как уже говорилось выше, выводить через *output* можно не только простые параметры, а практически любое JavaScript выражение,
например:

#{+= self.example()}

```jade-like
- namespace demo
- template calc(a, b)
	a + b = {Math.round(a) + b}
	{a > 10 ? '"a" great then 10' : '"a" less then 10'}
```

```classic
{namespace demo}
{template calc(name)}
	a + b = {Math.round(a) + b}
	{a > 10 ? '"a" great then 10' : '"a" less then 10'}
{/template}
```

#{/}

## Другие директивы

Помимо *output*, в Snakeskin существует множество других директив, которые помогут написать функциональный и
гибкий шаблон, например:

#{+= self.example()}

```jade-like
- namespace demo
- template index(value)
	- if Array.isArray(value)
		- forEach value => el
			{el}
```

```classic
{namespace demo}
{template index(name)}
	{if Array.isArray(value)}
		{forEach value => el}
			{el}
		{/}
	{/}
{/template}
```

#{/}

Узнать о всех директивах, которые поддерживает Snakeskin, можно в [документации проекта](#{@@api}).

## Глобальный контекст

Код, который находится вне тела шаблона или прототипа считается глобальным и помимо трансляции в JavaScript
выполняется на этапе трансляции.

#{+= self.example()}

```jade-like
\/// Данный forEach выполнится на этапе трансляции и войдёт в конечный JS
- forEach [1, 2, 3] => el
	? console.log(el)
```

```classic
\/// Данный forEach выполнится на этапе трансляции и войдёт в конечный JS
{forEach [1, 2, 3] => el}
	{? console.log(el)}
{/}
```

#{/}

## Работа с пробельными символами

Если не задан параметр [tolerateWhitespaces](#{@@api}#compile--tolerateWhitespaces), то любые пробельные символы
(перевод строки, пробел, табуляция и т.д.) в рамках шаблона Snakeskin трактуются как пробел и "схлопываются" в один, т.е.:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	Hello          world


	Bar
```

```classic
{namespace demo}
{template index()}
	Hello          world


	Bar
{/template}
```

#{/}

Отрендерится как:

```
Hello world Bar
```

Исключение составляют блоки [cdata](##{@@api}#cdata), литералы строк и регулярных выражений внутри директивы и
[jsDoc комментарии](#basics--jsDoc).

С помощью параметра [ignore](#{@@api}#compile--ignore) можно задать те пробельные символы, которые будут полностью
вырезаться из шаблона.

### Текстовые и логические директивы

Директивы Snakeskin можно условно разделить на 2 группы: текстовые и логические.

Текстовые директивы — это такие директивы, результат работы которых выводится в шаблон, например,
[output](#{@@api}#output) или [call](#{@@api}#call), а остальные директивы считаются логическими, например,
[if](#{@@api}#if) или [for](#{@@api}#for).

Логические директивы не участвуют в обработке пробелов, т.е.:

#{+= self.example()}

```jade-like
- namespace demo
- template index()
	Hello
	- if true

		- if true

			world
```

```classic
{namespace demo}
{template index()}
	Hello
	{if true}

		{if true}

			world
		{/if}
	{/if}
{/template}
```

#{/}

Отрендерится как:

```
Hello world
```

#{/block}
{/template}
