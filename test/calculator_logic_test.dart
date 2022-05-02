import 'package:calculator/calculator_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CalculatorProvider calculatorProvider;

  setUp(() {
    calculatorProvider = new CalculatorProvider();
  });

  test('Проверка успешности добавления цифры если нуль', () {
    // Act
    calculatorProvider.funcAC();
    var digit = 3;
    // Arrange
    calculatorProvider.addNumber(digit.toString());
    // Assert
    expect(calculatorProvider.resultCalculation, digit.toString());
  });

  test('Проверка успешности добавления цифры если не нуль', () {
    // Act
    calculatorProvider.funcAC();
    calculatorProvider.addNumber('3');
    var digit = 6;
    // Arrange
    calculatorProvider.addNumber(digit.toString());
    // Assert
    expect(calculatorProvider.resultCalculation, '36');
  });

  test('Проверка неудачи если при добавлении цифры подается не цифры', () {
    // Act
    calculatorProvider.funcAC();
    var digit = '-';
    // Arrange
    calculatorProvider.addNumber(digit.toString());
    // Assert
    expect(calculatorProvider.resultCalculation, '0.0');
  });

  test('Проверка успешности добавления операции в начало', () {
    // Act
    calculatorProvider.funcAC();
    var operation = '-';
    // Arrange
    calculatorProvider.addOperation(operation);
    // Assert
    expect(calculatorProvider.resultCalculation, '0.0');
    expect(calculatorProvider.helpedText, '0.0-');
  });

  test('Проверка неудачи если при добавлении операции подается число', () {
    // Act
    calculatorProvider.funcAC();
    var operation = '3';
    // Arrange
    calculatorProvider.addOperation(operation);
    // Assert
    expect(calculatorProvider.resultCalculation, '0.0');
    expect(calculatorProvider.helpedText, '');
  });

  test('Проверка успешности сброса значения', () {
    // Act
    calculatorProvider.funcAC();
    // Arrange
    calculatorProvider.funcAC();
    // Assert
    expect(calculatorProvider.resultCalculation, '0.0');
    expect(calculatorProvider.helpedText, '');
  });

  test('Проверка успешности изменения знака числа', () {
    // Act
    calculatorProvider.funcAC();
    var digit = 3;
    // Arrange
    calculatorProvider.addNumber(digit.toString());
    calculatorProvider.funcPlusMinus();
    // Assert
    expect(calculatorProvider.resultCalculation, '-3.0');
  });

  test('Проверка успешности удаления знака с конца', () {
    // Act
    calculatorProvider.funcAC();
    var digit = 3;
    var operation = '.';
    // Arrange
    calculatorProvider.addNumber(digit.toString());
    calculatorProvider.addOperation(operation);
    calculatorProvider.funcRemoveLast();
    // Assert
    expect(calculatorProvider.resultCalculation, '3');
  });

  test(
      'Проверка успешности удаления последнего числа и установка значения в нуль',
      () {
    // Act
    calculatorProvider.funcAC();
    var digit = 3;
    // Arrange
    calculatorProvider.addNumber(digit.toString());
    calculatorProvider.funcRemoveLast();
    // Assert
    expect(calculatorProvider.resultCalculation, '0');
  });

  test('Проверка успешности сложения двух чисел', () {
    // Act
    calculatorProvider.funcAC();
    var digitOne = 3;
    var digitTwo = 4;
    var operation = '+';
    // Arrange
    calculatorProvider.addNumber(digitOne.toString());
    calculatorProvider.addOperation(operation);
    calculatorProvider.addNumber(digitTwo.toString());
    calculatorProvider.funcEquals();
    // Assert
    expect(calculatorProvider.resultCalculation, '7.0');
  });

  test('Проверка успешности вычитания из числа', () {
    // Act
    calculatorProvider.funcAC();
    var digitOne = 4;
    var digitTwo = 3;
    var operation = '-';
    // Arrange
    calculatorProvider.addNumber(digitOne.toString());
    calculatorProvider.addOperation(operation);
    calculatorProvider.addNumber(digitTwo.toString());
    calculatorProvider.funcEquals();
    // Assert
    expect(calculatorProvider.resultCalculation, '1.0');
  });

  test('Проверка успешности умножения двух чисел', () {
    // Act
    calculatorProvider.funcAC();
    var digitOne = 3;
    var digitTwo = 4;
    var operation = '*';
    // Arrange
    calculatorProvider.addNumber(digitOne.toString());
    calculatorProvider.addOperation(operation);
    calculatorProvider.addNumber(digitTwo.toString());
    calculatorProvider.funcEquals();
    // Assert
    expect(calculatorProvider.resultCalculation, '12.0');
  });

  test('Проверка успешности деления двух чисел', () {
    // Act
    calculatorProvider.funcAC();
    var digitOne = 8;
    var digitTwo = 4;
    var operation = '/';
    // Arrange
    calculatorProvider.addNumber(digitOne.toString());
    calculatorProvider.addOperation(operation);
    calculatorProvider.addNumber(digitTwo.toString());
    calculatorProvider.funcEquals();
    // Assert
    expect(calculatorProvider.resultCalculation, '2.0');
  });

  test('Проверка успешности обработки ситуации деления на нуль', () {
    // Act
    calculatorProvider.funcAC();
    var digitOne = 3;
    var digitTwo = 0;
    var operation = '/';
    // Arrange
    calculatorProvider.addNumber(digitOne.toString());
    calculatorProvider.addOperation(operation);
    calculatorProvider.addNumber(digitTwo.toString());
    calculatorProvider.funcEquals();
    // Assert
    expect(calculatorProvider.resultCalculation, '0.0');
  });
}
