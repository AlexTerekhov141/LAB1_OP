#!/bin/bash

if [[ "$1" == "--help" ]]; then
	echo "Сценарий при запуске считывает из переменных окружения префикс имени каталога, число создаваемых каталогов и каталог, в котором необходимо получить результат работы. Результатом работы сценария должны быть каталоги с именами вида <префикс имени каталога>_<порядковый номер каталога>. Порядковый номер в имени каталога должен начинаться с единицы."
	exit 1
fi

if [ -z "$PREFIX" ] || [ -z "$NUM_DIRS" ] || [ -z "$RESULT_DIR" ];  then
	PREFIX=$1
	NUM_DIRS=$2
	RESULT_DIR=$3
	if [ -z "$PREFIX" ] || [ -z "$NUM_DIRS" ] || [ -z "$RESULT_DIR" ]; then
		echo "Prefix or NUM_DIRS or RESULT_DIR not selected"
		exit 1
	fi
fi

mkdir -p $RESULT_DIR

for ((i=1; i <= $NUM_DIRS; i++)); do
	dir_name="$PREFIX"_"$i"
	mkdir -p "$RESULT_DIR/$dir_name"
done

echo "Created $NUM_DIRS catalogs with prefix $PREFIX in catalog $RESULT_DIR"