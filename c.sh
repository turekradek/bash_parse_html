div#!/bin/bash
lista=()
for FILE in *;
do
    if [ "${FILE: -5}" == ".html" ]; then

        # cat $FILE;
        lista+=$FILE
        # lista+=" \n "
    fi
done

echo "1  "
echo ${#lista[@]}
for file in "$lista";
do
    if [ "${file: -5}" == ".html" ]; then
    echo " to jest plik html"
    # echo -e "$file"
    # echo "\n"
    fi
done
echo " NOWA LISTA ";
echo "   ";
i=0
lista2=()
files=(*)
echo "                       petla        28     linijka        "
for file in "${files[@]}"; 
do
    echo "$file"
    if [ "${file: -5}" == ".html" ]; then
    echo " to jest plik html           $file"
    lista2+=$file
    fi
done;
echo "   ";
echo "lista 2 ";
echo "$lista2";
echo " ";
echo "lista 2 w petli ";
echo " ";
for file in "${lista2[@]}"; 
do
    echo " ---   to powienien byc plik html    - "
    echo "$file"
    # if [ "${file: -5}" == ".html" ]; then
    # echo " to jest plik html"
    # lista2+=$file
    # fi
done;
echo " ";
echo " NOWA LISTA ";
echo "   ";
echo "TO JEST LISTA PLIKOW  $lista"
echo "                  dlugosc listy lista "
echo ${#lista[@]}
a=$(ls)
echo "TO JEST POLECENIE ZE ZMIENNEJ b"
echo $a;



echo " 2            ";
lista2=(*)
echo "DLUGOSC LISTY lista2 to "
echo " ${#lista2[@]}"
echo "   PETLA    PRZEZ    LISTA2     INNY SPOSOB           DEKLARACJA lista2=(*)      a wczesniej bylo w petli"
for file in "${lista2[@]}"; 
do
    echo "$file"
    if [ "${file: -5}" == ".html" ]; then
    echo "                     html          $file  "

    fi
done;


        # style=$(xmllint --html --xpath   '//div[@style]'  $file);
        # echo $style >> test.html;

        # cb_item=$(xmllint --html --xpath   '//div[@class="cb-item"]'  $file);
        # echo $cb_item >> ctest.html;

        # wrap_collabsible=$(xmllint --html --xpath   '//div[@class="wrap-collabsible"]'  $file);
        # echo $wrap_collabsible >> ctest.html;

xmllint --html --xpath   '//style'  airflow_dags_common.html   | sed 's/[][]//g' | sed 's/<!CDATA//' |  sed '$ s/^.//' > ctest.html 
xmllint --html --xpath   '//div[@style]'  airflow_dags_common.html >> ctest.html

title=$(xmllint --html --xpath   '//div[@class="header-title"]'  airflow_dags_common.html);
echo $title >> test.html;

xmllint --html --xpath   '//div[@class="cb-item"]'  airflow_dags_common.html >> ctest.html
ile_cb_item=$(xmllint --html --xpath   '//div[@class="cb-item"]'  airflow_dags_common.html | grep "cb-item" | wc -l)


xmllint --html --xpath   '//div[@class="wrap-collabsible"]'  airflow_dags_common.html >> ctest.html
ile_wrap_collabsible=$(xmllint --html --xpath    '//div[@class="wrap-collabsible"]'  airflow_dags_common.html | grep "wrap-collabsible" | wc -l)


xmllint --html --xpath   '//div[@class="cb-item"][2]'  airflow_dags_common.html >> ctest.html
xmllint --html --xpath   '//div[@class="wrap-collabsible"][2]'  airflow_dags_common.html >> ctest.html

cb_item=$(xmllint --html --xpath   '//div[@class="cb-item"]'  airflow_dags_common.html);
echo $cb_item >> ctest.html;
echo " dlugosc cb_item      ${#cb_item[@]}"
echo " ile razy clasa     $cb_item " | grep "cb-item" | wc -l 

wrap_collabsible=$(xmllint --html --xpath   '//div[@class="wrap-collabsible"]'  airflow_dags_common.html);
echo $wrap_collabsible >> ctest.html;
echo " dlugosc wrap_collabsible      ${#wrap_collabsible[@]}"

echo " -------- ------- -------- --------- ---------- ---------- "
echo  " -------- ------- -------- --------- ---------- ---------- " >> ctest.html
echo "                   ----------              -------------              ----------";
IFS='</div>'

