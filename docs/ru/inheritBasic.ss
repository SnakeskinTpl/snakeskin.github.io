- namespace docs.ru.guide['3::Наследование']['1::Концепция наследования. Блоки']

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

Важно понимать отличие простой декларации шаблона от декларации шаблона с наследованием.
При декларации простого шаблона мы описываем его структуру, а при наследовании описываем его изменения
относительно родителя, например:

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	Какой хороший день!

- template child() extends @base
	Может пойдём на речку?
```

```classic
{namespace demo}

{template base()}
	Какой хороший день!
{/template}

{template child() extends @base}
	Может пойдём на речку?
{/template}
```

#{/}

При вызове скомпилированной функции **child** результат будет точно таким же, как и у **base**: `Какой хороший день!`,
но мы скорее всего ожидали увидеть `Какой хороший день! Может пойдём на речку?`. Всё дело в том, что в тексте
шаблона child не были указаны изменения, а просто написана некоторая новая структура и Snakeskin не знает как именно
она должна расширять родительский шаблон и поэтому проигнорировал её.

Одним из способов декларации переопределяемых структур являются блоки ([вызываемые блоки](/api.html#block) являются частным случаем),
они позволяют создавать специальные структурные пометки, например:

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	- block root
		Какой хороший день!

- template child() extends @base
	- block root
		Может пойдём на речку?
```

```classic
{namespace demo}

{template base()}
	{block root}
		Какой хороший день!
	{/block}
{/template}

{template child() extends @base}
	{block root}
		Может пойдём на речку?
	{/block}
{/template}
```

#{/}

Теперь при вызове *child* результат будет: `Может пойдём на речку?`, т.к. в родительском шаблоне мы декларировали
блок *foo*, а в дочернем переопределили его. Мы также можем расширять дочерний шаблон путём введения новых блоков,
которых нет у родителя, и тогда они будут последовательно подставляться в конец тела родителя.

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	Какой хороший день!

- template child() extends @base
	- block sub
		Может пойдём на речку?
```

```classic
{namespace demo}

{template base()}
	Какой хороший день!
{/template}

{template child() extends @base}
	{block sub}
		Может пойдём на речку?
	{/block}
{/template}
```

#{/}

Теперь результат *child*: `Какой хороший день! Может пойдём на речку?`.

Сами по себе блоки никак не влияют на конечный вид шаблона, т.е.

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	- block sub
		Какой хороший день!

- template base2()
	Какой хороший день!
```

```classic
{namespace demo}

{template base()}
	{block sub}Какой хороший день!{/block}
{/template}

{template base2()}
	Какой хороший день!
{/template}
```

#{/}

Оба шаблона дадут абсолютно одинаковый ответ.

В пределах шаблона не может быть двух блоков с одинаковым названием. Название блоков подчиняется тем же правилам, что и
идентификаторы в JS. Внутри блока можно декларировать другие директивы, в частности другие блоки, константы и т.д.

#{+= self.example()}

```jade-like
- namespace demo

- template base()
	- block foo
		Какой хороший
		- block e
			день
		!

- template child() extends @base
	- block e
		пень
```

```classic
{namespace demo}

{template base()}
	{block foo}
		Какой хороший {block e}день{/block}!
	{/block}
{/template}

{template child() extends @base}
	{block e}пень{/block}
{/template}
```

#{/}

#{/block}
{/template}