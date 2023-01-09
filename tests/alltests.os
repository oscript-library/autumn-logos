#Использовать autumn
#Использовать asserts
#Использовать ".."
#Использовать "."

Перем мСообщенияЛога;

Процедура ПередЗапускомТеста() Экспорт

КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт

КонецПроцедуры

Функция ПодготовитьПоделку()
	Поделка = Новый Поделка();
	Поделка.ПросканироватьКаталог("src/Классы");
	Поделка.ПросканироватьКаталог("tests/Классы");
	Возврат Поделка;
КонецФункции

Процедура ДобавитьСебяКакОбработчикаВывода(Лог)

	мСообщенияЛога = Новый Массив;
	Лог.ДобавитьСпособВывода(ЭтотОбъект);

КонецПроцедуры

Процедура Вывести(Знач Сообщение, УровеньСообщения) Экспорт
	мСообщенияЛога.Добавить(Сообщение);
КонецПроцедуры

Процедура Закрыть() Экспорт
	мСообщенияЛога = Неопределено;
КонецПроцедуры

&Тест
Процедура Должен_ПроверитьПолучениеЛогов() Экспорт
	
	// Дано 
	Поделка = ПодготовитьПоделку();
	Поделка.ЗапуститьПриложение();

	// Когда 
	КонтейнерЛога = Поделка.НайтиЖелудь("КонтейнерЛога");
	ЭкспортныйЛог = КонтейнерЛога.ЭкспортныйЛог;
	ДобавитьСебяКакОбработчикаВывода(ЭкспортныйЛог);
	ЭкспортныйЛог.УстановитьУровень(УровниЛога.Отладка);
	ЭкспортныйЛог.Информация("Запись лога");
	СообщениеЭкспортногоЛога = мСообщенияЛога[0];

	ПриватныйЛог = КонтейнерЛога.ПриватныйЛог();
	ДобавитьСебяКакОбработчикаВывода(ПриватныйЛог);
	ПриватныйЛог.УстановитьУровень(УровниЛога.Отладка);
	ПриватныйЛог.Информация("Запись лога");
	СообщениеПриватногоЛога = мСообщенияЛога[0];

	ЛогСеттером = КонтейнерЛога.ПолучитьЛогСеттером();
	ДобавитьСебяКакОбработчикаВывода(ЛогСеттером);
	ЛогСеттером.УстановитьУровень(УровниЛога.Отладка);
	ЛогСеттером.Информация("Запись лога");
	СообщениеЛогаСеттером = мСообщенияЛога[0];

	ЛогБезПрефикса = КонтейнерЛога.ЛогБезПрефикса;
	ДобавитьСебяКакОбработчикаВывода(ЛогБезПрефикса);
	ЛогБезПрефикса.УстановитьУровень(УровниЛога.Отладка);
	ЛогБезПрефикса.Информация("Запись лога");
	СообщениеЛогаБезПрефикса = мСообщенияЛога[0];

	// Тогда
	Ожидаем.Что(ЭкспортныйЛог, "тип ЭкспортныйЛог").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(СообщениеЭкспортногоЛога, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [1.КонтейнерЛога] - Запись лога");
	
	Ожидаем.Что(ЛогСеттером, "тип ЛогСеттером").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(СообщениеЛогаСеттером, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [3.КонтейнерЛога] - Запись лога");
	Ожидаем.Что(ЛогСеттером, "Логгерны не равны").Не_().Равно(ПриватныйЛог);

	Ожидаем.Что(ЛогБезПрефикса, "тип ЛогБезПрефикса").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(СообщениеЛогаБезПрефикса, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [КонтейнерЛога] - Запись лога");
	Ожидаем.Что(ЛогБезПрефикса, "Логгерны не равны").Не_().Равно(ЭкспортныйЛог);

	Ожидаем.Что(ПриватныйЛог, "тип ПриватныйЛог").ИмеетТип(Тип("Лог"));
	Ожидаем.Что(ЭкспортныйЛог, "Логгерны не равны").Не_().Равно(ПриватныйЛог);
	Ожидаем.Что(СообщениеПриватногоЛога, "сообщение залогировано корректно").Равно("ИНФОРМАЦИЯ - [2.КонтейнерЛога] - Запись лога");

КонецПроцедуры


