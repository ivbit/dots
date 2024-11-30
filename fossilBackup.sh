#! /bin/sh
errorM() {
  >&2 printf '%s\n\n' "$1"
  exit 1
}
printf '\n%s\n%s\n' 'Резервное копирование файла репозитория Fossil.' "$1"
fossil test-integrity "$1"
if test $? -gt 0
then 
  errorM '*** ОШИБКА ПРОВЕРКИ ЦЕЛОСТНОСТИ РЕПОЗИТОРИЯ ***'
fi
printf '%s\n' 'Проверка целостности завершена успешно.'
cp "$1" ../fossilBackup/
if test $? -gt 0
then 
  errorM '*** ОШИБКА КОПИРОВАНИЯ ФАЙЛА ***'
fi
printf '%s\n\n' 'Копирование завершено успешно.'

