# $1、$2分别是存放HTML文件的文件夹 和 你要存放的笔记分支 ， 笔记分支比如 test

mkdir $1/photo
mv $1/*files/*.png $1/*files/*.PNG $1/*files/*.jpg $1/*files/*.JGP $1/*files/*.jpeg $1/*files/*.JPEG $1/photo

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

cp -R $1/photo $1/*.md /Users/apple/Documents/mynote/$2
rm -Rf $1/photo

rm -Rf $1/*files
rm $1/*.html

echo "Success"

exit