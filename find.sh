#!/bin/bash
echo "Программа поиска файлов"
echo "С помощью данной программы вы можете искать файл по имени или по размеру"
echo "Разработчик: Кокорев Дмитрий"
again=yes
while [ "$again" = "yes" ]
do
echo "Поиск по имени файла или по размеру? (name/size)"
read task
case $task in
name)echo "Введите каталог, в котором нужно найти файл"
read catalog1
if test -d /$catalog1
then
echo "Введите имя файла"
read name
if [ -f $name ]
then
find /$catalog1 -name $name -print
echo "Хотите продолжить? (yes/no)"
read again
else
echo "$(tput setaf 1)Ошибка!Такого файла в данном каталоге не существует$(tput setaf 0)"
echo "Хотите продолжить? (yes/no)"
read again
fi
else
echo "$(tput setaf 1)Ошибка!Такого каталога не существует$(tput setaf 0)"
echo "Хотите продолжить? (yes/no)"
read again
fi
;;
size)echo "Введите каталог, в котором нужно найти файл"
read catalog2
if [ -d /$catalog2 ]
then
echo "Введите размер файла(k,b)"
read size
find /$catalog2 -size $size -print
echo "Хотите продолжить? (yes/no)"
read again
else 
echo "$(tput setaf 1)Ошибка!Такого каталога не существует$(tput setaf 0)"
echo "Хотите продолжить? (yes/no)"
read again
fi
;;
*)echo "$(tput setaf 1)Ошибка!Поиск по такому запросу не может быть осуществлен$(tput setaf 0)"
echo "Хотите продолжить? (yes/no)"
read again
esac
done
echo
