키 스토어 생성
keytool -genkey -v -keystore c:\keystore\mycloset.keystore -alias myclosetkeystore -keyalg rsa -keysize 2048 -validity 365

키 스토어에 CSR키 생성
keytool -export -alias myclosetkeystore -storepass qwerty -file c:\keystore\myclosetcsr.csr -keystore c:\keystore\mycloset.keystore

csr 파일을 읽을수 있게 txt로 만든다
keytool -certreq -alias myclosetkeystore -keyalg rsa -file c:\keystore\crs.txt -keystore c:\keystore\mycloset.keystore


참조 사이트 : https://www.lesstif.com/pages/viewpage.action?pageId=20775436