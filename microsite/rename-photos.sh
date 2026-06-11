#!/bin/bash
# Renames all images in microsite/photos/ to photo-01.jpg, photo-02.jpg, etc.
# Run from the repo root: bash microsite/rename-photos.sh

PHOTOS_DIR="$(dirname "$0")/photos"
count=1

for f in "$PHOTOS_DIR"/*.jpg "$PHOTOS_DIR"/*.jpeg "$PHOTOS_DIR"/*.JPG "$PHOTOS_DIR"/*.JPEG "$PHOTOS_DIR"/*.png "$PHOTOS_DIR"/*.PNG; do
  [ -f "$f" ] || continue
  ext="${f##*.}"
  # normalise extension to lowercase jpg
  new="$PHOTOS_DIR/$(printf 'photo-%02d' $count).jpg"
  if [ "$f" != "$new" ]; then
    mv "$f" "$new"
    echo "  $f → photo-$(printf '%02d' $count).jpg"
  fi
  count=$((count + 1))
done

echo ""
echo "Done. $((count - 1)) photo(s) renamed."
echo "Photos 01-06 → Japan page"
echo "Photos 07-12 → Italy page"
echo "Photos 13-18 → Uruguay page"
echo "All photos   → /photos.html gallery"
