"""Build the downloadable extension using only Python's standard library."""
from pathlib import Path
from zipfile import ZipFile, ZipInfo, ZIP_DEFLATED

source = Path(__file__).resolve().parent
repo = source.parents[2]
destination = repo / "academy/public/downloads/academy-color-keys.aseprite-extension"
destination.parent.mkdir(parents=True, exist_ok=True)

with ZipFile(destination, "w") as archive:
    for name in ("package.json", "main.lua", "README.md"):
        entry = ZipInfo(name, date_time=(2026, 1, 1, 0, 0, 0))
        entry.compress_type = ZIP_DEFLATED
        entry.external_attr = 0o100644 << 16
        archive.writestr(entry, (source / name).read_bytes())

print(destination)
