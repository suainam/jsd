for f in $(find ./ -iname "*.jpg"); do

    cwebp -resize 234 139 $f -o ./webp/${f/.jpg/}.webp

done
