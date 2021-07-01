﻿#language: ru

@tree

Функционал: Проверка методов API сервиса КЭДО

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект> 

Контекст: 
	И Я запоминаю значение выражения 'Новый Структура("ApiKey, OrganizationId", "5413a447-7588-43a5-904f-d8b757f86b57", 23)' в переменную "ПараметрыАвторизации"
	И Я запоминаю значение выражения 'Новый Структура("ApiKey, OrganizationId")' в переменную "ПустыеПараметрыАвторизации"
	И Я запоминаю значение выражения 'Число(212)' в переменную "ДокументИд"
	И Я запоминаю значение выражения 'Число(12345)' в переменную "НесуществующийДокументИд"
	И Я запоминаю значение выражения 'Число(431)' в переменную "СотрудникИд"
	И Я запоминаю значение выражения 'Число(12345)' в переменную "НесуществующийСотрудникИд"
	И Я запоминаю значение выражения 'Число(13)' в переменную "ПодразделениеИд"
	И Я запоминаю значение выражения 'Число(999)' в переменную "НесуществующееПодразделениеИд"
	И Я запоминаю значение выражения 'Новый Структура("parentId, name, code, isActive", 4, "ТестVA", "tstva",  Истина)' в переменную "ПараметрыОбновленияПодразделения"
	
Сценарий: Проверка вызова метода GET (api/v1.0/administrator/organization/apiKey)
	Когда Я выполняю метод API v1_Administrator_OrganizationApiKey c параметрами "$ПараметрыАвторизации$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода GET (api/v1.0/administrator/organization/apiKey)
	Когда Я выполняю метод API v1_Administrator_OrganizationApiKey c параметрами "$ПустыеПараметрыАвторизации$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Ложь"

Сценарий: Проверка вызова метода GET (api/v1.0/organization)
	Когда Я выполняю метод API v1_Organization c параметрами "$ПараметрыАвторизации$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода GET (api/v1.0/manager/organizationUser)
	Когда Я выполняю метод API v1_Manager_OrganizationUser c параметрами "$ПараметрыАвторизации$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"
	
Сценарий: Проверка вызова метода GET (api/v1.0/manager/organizationUser/managers)
	Когда Я выполняю метод API v1_Manager_OrganizationUserManagers c параметрами "$ПараметрыАвторизации$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода POST (api/v1.0/manager/organizationUser/{id}/lock)
	Когда Я выполняю метод API v1_Manager_OrganizationUserLock c параметрами "$ПараметрыАвторизации$", "$СотрудникИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода POST (api/v1.0/manager/organizationUser/{id}/lock)
	Когда Я выполняю метод API v1_Manager_OrganizationUserLock c параметрами "$ПараметрыАвторизации$", "$НесуществующийСотрудникИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Ложь"

Сценарий: Проверка вызова метода POST (api/v1.0/manager/organizationUser/{id}/unlock)
	Когда Я выполняю метод API v1_Manager_OrganizationUserUnlock c параметрами "$ПараметрыАвторизации$", "$СотрудникИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода POST (api/v1.0/manager/organizationUser/{id}/unlock)
	Когда Я выполняю метод API v1_Manager_OrganizationUserUnlock c параметрами "$ПараметрыАвторизации$", "$НесуществующийСотрудникИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Ложь"

Сценарий: Проверка вызова метода GET (api/v1.0/manager/department)
	Когда Я выполняю метод API v1_Manager_Department c параметрами "$ПараметрыАвторизации$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода PUT (api/v1.0/administrator/department/{id})
	Когда Я выполняю метод API v1_Administrator_DepartmentUpdate c параметрами "$ПараметрыАвторизации$", "$ПодразделениеИд$", "$ПараметрыОбновленияПодразделения$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода PUT (api/v1.0/administrator/department/{id})
	Когда Я выполняю метод API v1_Administrator_DepartmentUpdate c параметрами "$ПараметрыАвторизации$", "$НесуществующееПодразделениеИд$", "$ПараметрыОбновленияПодразделения$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Ложь"

Сценарий: Проверка вызова метода GET (api/v1.0/manager/document)
	Когда Я выполняю метод API v1_Manager_Document c параметрами "$ПараметрыАвторизации$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода GET (api/v1.0/manager/document/{id})
	Когда Я выполняю метод API v1_Manager_DocumentDetails c параметрами "$ПараметрыАвторизации$", "$ДокументИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода GET (api/v1.0/manager/document/{id})
	Когда Я выполняю метод API v1_Manager_DocumentDetails c параметрами "$ПараметрыАвторизации$", "$НесуществующийДокументИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Ложь"

Сценарий: Проверка вызова метода GET (api/v1.0/user/document/{id}/download)
	Когда Я выполняю метод API v1_User_DocumentDownload c параметрами "$ПараметрыАвторизации$", "$ДокументИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода GET (api/v1.0/user/document/{id}/download)
	Когда Я выполняю метод API v1_User_DocumentDownload c параметрами "$ПараметрыАвторизации$", "$НесуществующийДокументИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Ложь"

Сценарий: Проверка вызова метода GET (api/v1.0/manager/document/{id})
	Когда Я выполняю метод API v1_Manager_DocumentDownload c параметрами "$ПараметрыАвторизации$", "$ДокументИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода GET (api/v1.0/manager/document/{id})
	Когда Я выполняю метод API v1_Manager_DocumentDownload c параметрами "$ПараметрыАвторизации$", "$НесуществующийДокументИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Ложь"	

Сценарий: Проверка вызова метода GET (api/v1.0/document/{id}/downloadWithSignatures)
	Когда Я выполняю метод API v1_Manager_DocumentDownloadWithSignatures c параметрами "$ПараметрыАвторизации$", "$ДокументИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"

Сценарий: Проверка вызова метода GET (api/v1.0/document/{id}/downloadWithSignatures)
	Когда Я выполняю метод API v1_Manager_DocumentDownloadWithSignatures c параметрами "$ПараметрыАвторизации$", "$НесуществующийДокументИд$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Ложь"

Сценарий: Проверка вызова метода GET (api/v1.0/manager/event)
	Когда Я выполняю метод API v1_Manager_Event c параметрами "$ПараметрыАвторизации$" и сохраняю результат выполнения в контексте как "Ответ"
	Тогда Я ожидаю, что значение контекста "Ответ.Успех" равно "Истина"


