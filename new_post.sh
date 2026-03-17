#!/usr/bin/env bash
set -euo pipefail

DATE=$(date +%Y-%m-%d)

if [ $# -gt 0 ]; then
  DIR="src/content/blog/$1"
  if [ ! -d "$DIR" ]; then
    echo "Directory does not exist: $DIR"
    echo "Create it with: mkdir -p $DIR"
    exit 1
  fi
  FILE="$DIR/${DATE}.md"
else
  FILE="src/content/blog/${DATE}.md"
fi

if [ -f "$FILE" ]; then
  echo "Post already exists: $FILE"
  exit 1
fi

cat > "$FILE" << EOF
---
title: ""
pubDate: ${DATE}
description: ""
---

### 做了什麼

-

### 筆記/心得

EOF

echo "Created: $FILE"
