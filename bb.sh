!/bin/bash

echo "  TWORZENIE JEDNEGO PLIKU HTML Z WIELU PLIKÓW    ";

echo "DLUGOSC LISTY lista2 to "
lista2=()
# LIST OF FILES IF HTML 
lista2=$(ls ~/a/pliki | grep html)
# TAKE STYLE SECTION TO TEST FILE 
xmllint --html --xpath   '//style'  ./pliki/airflow_dags_common.html   | sed 's/[][]//g' | sed 's/<!CDATA//' |  sed '$ s/^.//' > test4.html 

# WRITE SECTION //div[@style] CHILD //* EXCLUDE [not(@class="header-title") and not(img[last()])]
xmllint --html --xpath   '//div[@style]//*[not(@class="header-title") and not(img[last()])]'  ./pliki/airflow_dags_common.html  >> test4.html


echo " ${#lista2[@]}"

# JOIN FILES IF CONDITIONS ARE ...
for file in $lista2;
do

    cb_item_ile=0;

    cb_item_ile=$(xmllint --html --xpath   '//div[@class="cb-item"]'  ./pliki/$file | grep "cb-item" | wc -l);
    echo " SHOW cb_item_ile    $cb_item_ile"
    if [ $cb_item_ile -ne 0 ];then
        echo "<br> " >> test4.html ;
        echo "<br> " >> test4.html ;
        echo "<h2>   $file    </h2>" >> test4.html;
        title=$(xmllint --html --xpath   '//div[@class="header-title"]'  ./pliki/$file);
        echo $title >> test4.html;

        for (( i=1 ; i<=$cb_item_ile ; i++))
        do 
            # cb_item=$(xmllint --html --xpath   '//div[@class="cb-item"]'  $file);
            echo $cb_item >> test4.html;
            xmllint --html --xpath   "//div[@class=\"cb-item\"][$i]"   ./pliki/$file    >> test4.html
            xmllint --html --xpath   "//div[@class=\"wrap-collabsible\"][$i]"  ./pliki/$file >> test4.html

        done
    fi
    # echo "<br> " >> test4.html ;

   
done



