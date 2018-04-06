/* Using WebCrypto.swift. You can download it using this link:
 * https://github.com/etienne-martin/WebCrypto.swift
 */

public class AES {
  
     func encryptValue(_ base64Key: String, _ value: String) {
        let base64KeyData = Data(base64Encoded: base64Key)!
        let hexKey = base64KeyData.map { String(format: "%02x", $0) }.joined()
        let valuedata = Data(value.utf8)
        crypto.encrypt(data: valuedata, key: hexKey, iv: hexKey, callback: {(encrypted: Data?, error: Error?) in
            if let error = error {
                print(error)
            } else {
                print(encrypted!.base64EncodedString())
            }
        })
    } 
  
  
  /* Sample Implementation */
  let base64Key: String = "zjcSX3TumLzbJfpW\\/Zzung=="
  let value: String = "anitaaiostest1"
  encryptValue(base64Key, value) // -> uKpbnE5XviQFU+dpWWD0oA==
}