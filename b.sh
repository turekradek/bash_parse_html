#!/bin/bash

echo "  TWORZENIE JEDNEGO PLIKU HTML Z WIELU PLIKÓW    ";

echo "DLUGOSC LISTY lista2 to "
lista2=()
lista2=$(ls ~/a/pliki | grep html)
# TAKE STYLE SECTION TO TEST FILE 
xmllint --html --xpath   '//style'  ./pliki/airflow_dags_common.html   | sed 's/[][]//g' | sed 's/<!CDATA//' |  sed '$ s/^.//' > test4.html 

# header_title=$(xmllint --html --xpath   '//div[@class="header-title"]' airflow_dags_common.html )
# xmllint --html --xpath   '//div[@style]'  airflow_dags_common.html | sed $header_title >> test4.html
# xmllint --html --xpath   '//div[@style]'  airflow_dags_common.html >> test4.html
# echo "<h3> ---------------------------------------- </h3>" >> test4.html

# xmllint --html --xpath   '//div[@style]//*[not(@class[last()])]'  airflow_dags_common.html  >> test4.html
# xmllint --html --xpath   '//div[@style]//*[not(@class="header-title")]'  airflow_dags_common.html  >> test4.html
xmllint --html --xpath   '//div[@style]//*[not(@class="header-title") and not(img[last()])]'  ./pliki/airflow_dags_common.html  >> test4.html
# echo "<h3> ---------------------------------------- </h3>" >> test4.html
# xmllint --html --xpath   '//div[@style]//*[not(img[last()])]'  airflow_dags_common.html  >> test4.html
# xmllint --html --xpath   '//div[@style]'  airflow_dags_common.html  >> test4.html
# echo "<h3> ---------------------------------------- </h3>" >> test4.html
# xmllint --html --xpath   '//div[@style]//*[not(img)]'  airflow_dags_common.html
# xmllint --html --xpath   '//div[@style]'  airflow_dags_common.html >> test4.html # TRZEBA TO DODAC ALE BEZ TYTULU BO MUSI BYC ZDJECIE ALE BEZ TYTULU 

#     </div>
#     <div class="header-spacer">&nbsp;</div>
# </div>
# <div>')
# $div_style >> test4.html 
# xmllint --html --xpath   '//style'  ${lista2[1]}   | sed 's/[][]//g' | sed 's/<!CDATA//' |  sed '$ s/^.//' > test4.html 
# xmllint --html --xpath   '//div[@style]'  ${lista2[1]} >> test4.html # TRZEBA TO DODAC ALE BEZ TYTULU BO MUSI BYC ZDJECIE ALE BEZ TYTULU 

echo " ${#lista2[@]}"
# for file in $lista2;
# do

#     cb_item_ile=0;
#     echo " ";
#     echo "<h1> ----------------  $file   --------------------- </h1>" >> test4.html;
#     title=$(xmllint --html --xpath   '//div[@class="header-title"]'  $file);
#     echo $title >> test4.html;
#     echo " ";       
#     echo " ";
#     cb_item_ile=$(xmllint --html --xpath   '//div[@class="cb-item"]'  $file | grep "cb-item" | wc -l);
#     if [ $cb_item_ile > 0 ];then
#         for (( i=1 ; i<=$cb_item_ile ; i++))
#         do 
#             # cb_item=$(xmllint --html --xpath   '//div[@class="cb-item"]'  $file);
#             echo $cb_item >> test4.html;
#             xmllint --html --xpath   "//div[@class=\"cb-item\"][$i]"   $file    >> test4.html
#             xmllint --html --xpath   "//div[@class=\"wrap-collabsible\"][$i]"  $file >> test4.html

#         done
#     fi
   
# done
# ready 
for file in $lista2;
do

    cb_item_ile=0;

    cb_item_ile=$(xmllint --html --xpath   '//div[@class="cb-item"]'  ./pliki/$file | grep "cb-item" | wc -l);
    echo "ile to w koncu    $cb_item_ile"
    if [ $cb_item_ile -ne 0 ];then
        echo " ";
        echo " to jak zero $cb_item_ile to co tu robisz "
        echo "<h1> --------------------------  $file   -------       -------------- </h1>" >> test4.html;
        title=$(xmllint --html --xpath   '//div[@class="header-title"]'  ./pliki/$file);
        echo $title >> test4.html;
        echo " ";       
        echo " ";

        for (( i=1 ; i<=$cb_item_ile ; i++))
        do 
            # cb_item=$(xmllint --html --xpath   '//div[@class="cb-item"]'  $file);
            echo $cb_item >> test4.html;
            xmllint --html --xpath   "//div[@class=\"cb-item\"][$i]"   ./pliki/$file    >> test4.html
            xmllint --html --xpath   "//div[@class=\"wrap-collabsible\"][$i]"  ./pliki/$file >> test4.html

        done
    fi
   
done



