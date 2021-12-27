for i in recipes/*.tex
do
  echo "####################################"
  echo $i
  xelatex --output-directory=rendered_cards $i 
done

rm rendered_cards/*.aux
rm rendered_cards/*.log 