for filename in `ls $1`
do
	fname=`basename $filename` 
	if [[ $fname == *.html ]]
	then
		fname=`basename $filename .html`
		name=${fname%.*}
		echo $name
		python  html2text.py $1$name.html utf8 > $1$name.md
	fi
done 
exit 
