powershell rm ./release/* -Force
powershell flutter build web
powershell copy ./build/web/* ./release