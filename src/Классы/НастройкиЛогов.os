#Использовать logos

Перем _НастройкиУровнейЛогов;
Перем _НастройкиАппендеров;

Перем СоответсвиеУровнейЛогов;

&Желудь
Процедура ПриСозданииОбъекта(
	&Деталька(Значение = "logos.logger", ЗначениеПоУмолчанию = Неопределено) НастройкиУровнейЛогов,
	&Деталька(Значение = "logos.appender", ЗначениеПоУмолчанию = Неопределено) НастройкиАппендеров
	)
	_НастройкиАппендеров = ?(НастройкиАппендеров = Неопределено, Новый Соответствие(), НастройкиАппендеров);
	_НастройкиУровнейЛогов = ?(НастройкиУровнейЛогов = Неопределено, Новый Соответствие(), НастройкиУровнейЛогов);

	Инициализация();
КонецПроцедуры

Процедура Инициализация()
	СоответсвиеУровнейЛогов = Новый Соответствие();
	СоответсвиеУровнейЛогов.Вставить("DEBUG", УровниЛога.Отладка);
	СоответсвиеУровнейЛогов.Вставить("INFO", УровниЛога.Информация);
	СоответсвиеУровнейЛогов.Вставить("WARN", УровниЛога.Предупреждение);
	СоответсвиеУровнейЛогов.Вставить("ERROR", УровниЛога.Ошибка);
	СоответсвиеУровнейЛогов.Вставить("CRITICALERROR", УровниЛога.КритичнаяОшибка);
	СоответсвиеУровнейЛогов.Вставить("DISABLE", УровниЛога.Отключить);
КонецПроцедуры

Функция ПолучитьУровеньЛогаПоТексту(Знач УровеньЛогаТекстом) Экспорт
	
	УровеньЛогаТекстом = ВРег(УровеньЛогаТекстом);

	Если УровеньЛогаТекстом = "DEFAULT" Тогда 
		Возврат Неопределено;
	Иначе
		Уровень = СоответсвиеУровнейЛогов[УровеньЛогаТекстом];
		Если Уровень = Неопределено Тогда
			ВызватьИсключение СтрШаблон("Неизвестный уровень лога %1", УровеньЛогаТекстом);
		Иначе
			Возврат Уровень;
		КонецЕсли;
	КонецЕсли;

КонецФункции

Функция ПолучитьУровеньЛогаПоИмени(ИмяЛога) Экспорт

	УровеньТекстом = _НастройкиУровнейЛогов[ИмяЛога];

	Если УровеньТекстом = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;

	Уровень = ПолучитьУровеньЛогаПоТексту(УровеньТекстом);

	Возврат Уровень;
	
КонецФункции

Функция ПолучитьАппендерПоИмени(ИмяЛога) Экспорт
	Возврат _НастройкиАппендеров[ИмяЛога];
КонецФункции
