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
cd encmodule
unzip $input
gcc enc.c aes.c base64.c -o enc -I.
$php enc.php input.php -o "enc-$date_s"
save=$(realpath "/runner/encmodule/enc-$date_s.tar.gz")
cd /output && tar -xf $save && cd /runner
