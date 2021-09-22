powershell rm ./release/* -Force
powershell flutter build web
powershell copy-item ./build/web/* ./release -Recurse