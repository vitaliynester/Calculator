# Калькулятор написанный на Flutter

Это приложение представляет собой калькулятор с основными арифметическими операциями. Версия используемого фреймворка Flutter 1.17.5. 

Описание файлов проекта:
```
│   pubspec.lock  --файл используемый Flutter`ом для описания подключенных библиотек
│   pubspec.yaml  --файл для подключения новых библиотек 
│
├───images                  --папка с фотографиями для представления в профиле
│       img1.png
│
└───lib                         --основные используемые файлы
        calculator_button.dart  --виджет описывающий логику и стиль для кнопки
        calculator_logic.dart   --класс с описанием основных функций используемых калькулятором
        calculator_view.dart    --основное окно, которое демонстрируется пользователю
        gesture_button.dart     --виджет самой кнопки (логика и стиль кнопки в GestureDetector`е)
        main.dart               --точка входа в приложении
```
## Используемые библиотеки
* google_fonts: ^1.1.0      --шрифты от Google, используется Montserrat font  
*  auto_size_text: ^2.1.0    --библиотека для удобного зумирования текста  
*  math_expressions: ^2.0.0  --библиотека реализующая основные функции калькулятора

## ToDo
* Неправильная работа на больших числах (неправильная конвертация чисел представленных в виде E+..)

## Изображения приложения

<p align="center">
  <b>Главное окно</b>
</p>
<p align="center">
  <img src="/images/img1.png">
</p>
