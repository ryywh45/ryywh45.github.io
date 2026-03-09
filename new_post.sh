#!/usr/bin/env bash
set -euo pipefail

DATE=$(date +%Y-%m-%d)
FILE="src/content/blog/${DATE}.md"

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

### 今天做了什麼

-

### 筆記

### 明日待辦

- [ ]
EOF

echo "Created: $FILE"
