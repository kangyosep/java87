Ű ����� ����
keytool -genkey -v -keystore c:\keystore\mycloset.keystore -alias myclosetkeystore -keyalg rsa -keysize 2048 -validity 365

Ű ���� CSRŰ ����
keytool -export -alias myclosetkeystore -storepass qwerty -file c:\keystore\myclosetcsr.csr -keystore c:\keystore\mycloset.keystore

csr ������ ������ �ְ� txt�� �����
keytool -certreq -alias myclosetkeystore -keyalg rsa -file c:\keystore\crs.txt -keystore c:\keystore\mycloset.keystore


���� ����Ʈ : https://www.lesstif.com/pages/viewpage.action?pageId=20775436