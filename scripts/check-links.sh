#!/bin/bash
# check-links.sh — 驗證所有 markdown 內部 link 可達
#
# 用法：./scripts/check-links.sh
# Exit code 0 = 全部通過、1 = 有壞 link

set -euo pipefail

cd "$(dirname "$0")/.."

uv run python3 <<'PYEOF'
import re
import sys
from pathlib import Path

root = Path('.')
md_files = [f for f in root.rglob('*.md') if '.claude' not in str(f) and '.git' not in str(f)]
link_pattern = re.compile(r'\[([^\]]*)\]\(([^)]+)\)')

broken = []
total = 0

for md_file in md_files:
    for m in link_pattern.finditer(md_file.read_text(encoding='utf-8')):
        link = m.group(2)
        if link.startswith(('http://', 'https://', 'mailto:', '#')):
            continue
        target = link.split('#')[0]
        if not target:
            continue
        total += 1
        if not (md_file.parent / target).resolve().exists():
            broken.append((str(md_file), link))

print(f"Total internal links: {total}")
print(f"Broken: {len(broken)}")

if broken:
    print("\nBROKEN LINKS:")
    for f, l in broken:
        print(f"  {f} → {l}")
    sys.exit(1)
else:
    print("All internal links resolve OK")
    sys.exit(0)
PYEOF
