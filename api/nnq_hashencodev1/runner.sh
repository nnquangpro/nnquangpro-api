input=$1
pkg_name=$2
id=$3
maindir=$4
pkg_home="$maindir/api/$pkg_name"
date_s=$(date +"%d-%m-%y_%H.%m.%S")
# Uncompress PHP
cd / && tar -xf "/gdrive/php.tar.gz"
php="/tmp/php-api-main/8.3.4/bin/php"
cd /runner
# Uncompress Packages
tar -xf "/gdrive/packages.tar.gz"
cd hashmodule
unzip $input
gcc enc.c aes.c base64.c -o enc -I.
echo "Remove test file"
rm -rf pwh.php
echo "File sẽ được Hash : "
ls input
for i in $(ls input);
do
	$php hash.php input/$i -o $i;
done
cp -rf hashed/* /output
cd /runner
