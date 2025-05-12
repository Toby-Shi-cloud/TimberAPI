#! /bin/bash -e

copy_dll () {
  name="$1"
  cp "Src/$name/bin/Release/netstandard2.1/$name.dll" "packages/version-0.7/core/"
}

ROOT="TimberApi"
CORES="Tools BottomBarSystem SpecificationSystem"

dotnet build -c Release
rm packages/version-0.7/core/*.dll
copy_dll $ROOT
for pkg in $CORES; do
  copy_dll "$ROOT.$pkg"
done

rm -rf ~/Documents/Timberborn/Mods/TimberApi
cp -r packages ~/Documents/Timberborn/Mods/TimberApi
